#!/usr/bin/env node

const MsgReader = require('@kenjiuno/msgreader')["default"];
const fs = require('fs');
const path = require('path');

const filePath = process.argv[2];
if (!filePath) {
    console.error('Please provide a .msg file as an argument.');
    process.exit(1);
}

const fileBuffer = fs.readFileSync(filePath);
const reader = new MsgReader(fileBuffer);
const msg = reader.getFileData();

const { subject, senderName, creatorSMTPAddress, recipients, body, attachments } = msg;

const from = `${senderName} < ${creatorSMTPAddress} > `;
const toRecipients = recipients.filter((recipient) => recipient.recipType === 'to');
const ccRecipients = recipients.filter((recipient) => recipient.recipType === 'cc');
const to = toRecipients.map((recipient) => `${recipient.name} < ${recipient.smtpAddress} > `).join(', ');
const cc = ccRecipients.map((recipient) => `${recipient.name} < ${recipient.smtpAddress} > `).join(', ');
const bodyWithLineBreaks = body.replace(/\r\n/g, '<br>');

const attachmentLinks = attachments.map((attachment, index) => {
    const attachmentData = Buffer.from(reader.getAttachment(attachment).content);
    const attachmentFileName = `attachment_${index + 1}${path.extname(attachment.fileName)}`;


    // Create parent directories if they don't exist
    const attachmentDir = path.join(path.dirname(filePath), 'out');
    if (!fs.existsSync(attachmentDir)) {
        fs.mkdirSync(attachmentDir, { recursive: true });
    }

    fs.writeFileSync(path.join(attachmentDir, attachmentFileName), attachmentData);

    return `<li><a class="attachment-link" href="${attachmentFileName}" download>${attachment.fileName}</a></li>`;
});
const attachmentList = attachmentLinks.join('');

const htmlContent = fs.readFileSync('page.html', 'utf-8');
const processedHtmlContent = htmlContent.replace('${subject}', subject)
    .replace('${from}', from)
    .replace('${to}', to)
    .replace('${cc}', cc)
    .replace('${bodyWithLineBreaks}', bodyWithLineBreaks)
    .replace('${attachmentList}', attachmentList);

const emailName = path.basename(filePath, path.extname(filePath));
const outDirectory = path.join(path.dirname(filePath), 'out');
const fileName = path.join(outDirectory, `email_${emailName}.html`);

if (!fs.existsSync(outDirectory)) {
    fs.mkdirSync(outDirectory, { recursive: true });
}

fs.writeFileSync(fileName, processedHtmlContent);

console.log(`Email content has been extracted and saved to ${fileName}.`);