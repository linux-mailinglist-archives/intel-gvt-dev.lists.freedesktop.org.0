Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHW9LQl6p2lshwAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 04 Mar 2026 01:17:13 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5441F8CC6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 04 Mar 2026 01:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D237C10E8FB;
	Wed,  4 Mar 2026 00:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=forgevue.forum header.i=blueshieldbluecross@forgevue.forum header.b="GNyemAG3";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 00:17:10 UTC
Received: from outbound.forgevue.forum (unknown [45.13.214.212])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D51D10E8FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Mar 2026 00:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtafbbibzj6ap;
 d=forgevue.forum; 
 h=MIME-Version:To:Subject:Reply-To:Message-ID:List-Unsubscribe:Date:From:
 Content-Type; i=blueshieldbluecross@forgevue.forum;
 bh=XdIPk1EJMowkUfAcwBVUAzYM8Cthq1RI+hYSPOr8tVk=;
 b=GNyemAG3l4Z4mQpzzK+q22U3XaS9aqTBzjRjop/+UiN9kncYFW9uW2RkVhbb3qq0G46S6xDiUyIo
 C3kFdNfyUIactUrWCOXChhz2HdSwznO2FG8FrhjuHHxUFhvEi1u77HYJI8xhpI2XlDTpA6diUjf1
 Q1CSfuZC4ejjwKndMX5ONYk4jQc3cxuYMTGUdIU0Q8QivMEZxQpHeHVl7/7iyokeVpiJJQ2ai6Ia
 8RPQxFQdYxKndzye1sEp72upaTq/pm9MYAFGVW9UTYp8snSQQy5CZKfBmHoXD38Lhrmt/gsHZag6
 IgLE4E4egiqnu/idjHz36mSKvDM2v6LU+e95mw==
List-Unsubscribe-Post: List-Unsubscribe=One-Click
MIME-Version: 1.0
To: intel-gvt-dev@lists.freedesktop.org
Subject: Time to review your 2026 plan options
Message-ID: <812382.d9c6494e3561f5a1ee1c.e6p05ouwkrbgqj61xoisl0a@forgevue.forum>
Date: Tue, 3 Mar 2026 19:12:02 -0500
From: Blue Shield Blue Cross <blueshieldbluecross@forgevue.forum>
Content-Type: multipart/alternative;
 boundary="----=_HeaderBoundary.doealwjgsbviqwewamkehdtcs80772440"
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: blueshieldbluecross@forgevue.forum
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0F5441F8CC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.74 / 15.00];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	R_DKIM_REJECT(1.00)[forgevue.forum:s=mtafbbibzj6ap];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[forgevue.forum : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	ZERO_FONT(0.10)[1];
	MANY_INVISIBLE_PARTS(0.10)[2];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[forgevue.forum:-];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueshieldbluecross@forgevue.forum,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_REPLYTO(0.00)[blueshieldbluecross@forgevue.forum]
X-Rspamd-Action: no action

------=_HeaderBoundary.doealwjgsbviqwewamkehdtcs80772440
Content-Type: text/plain; charset="UTF-8"

I think the best approach is to schedule the project review for next Tuesday afternoon. That gives everyone enough time to compile their updates. We can use the main conference room if it's available, otherwise the small one by the kitchen works too. Let me know if you need me to bring any specific documents or if you want to adjust the agenda items. I'll send a calendar invite once we confirm.

BlueCross
BlueShield

Your 2026 Plan Information & Kit

We are writing to inform you of updates to your coverage plan for the coming year. As part of this annual review, a Medicare Kit is being provided to households in your area. You will not be billed for the kit.

Program Details: This kit is provided at no charge. One kit is allocated per household. The total program allocation is 800 kits. This offering concludes tomorrow.

What Your Kit Contains

The kit includes a selection of useful medical supplies to have on hand.

• Adhesive Bandage Strips

• Digital Thermometer

• Antiseptic Wipes

• First Aid Instruction Guide

• Gauze Pads

• Medical Tape

• Disposable Gloves

• Pain Reliever Packets

Quantities are determined by the program's allocation.

View Kit & Plan Details

Along with your kit, your 2026 plan coverage information is available for your review. This outlines the various options and selections pertinent to your coverage.

Thank you for being a member of our community. We are here to support your health journey.

Regarding the weekend plans, yes, the farmer's market starts at 8 am. I can meet you there by the main entrance. They usually have great seasonal produce this time of year. After that, we could grab coffee at that new place on Maple Street. Don't forget to bring your reusable bags. Let me know if you're running late.

------=_HeaderBoundary.doealwjgsbviqwewamkehdtcs80772440
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="margin:0; padding:20px 0; background-color:#E6F3F7; font-family: Georgia, 'Times New Roman', Times, serif; color:#3A3A3A; line-height:1.5;">
<div style="font-family: Helvetica, Arial, sans-serif; font-size:0; line-height:0; max-height:0; overflow:hidden;">
I think the best approach is to schedule the project review for next Tuesday afternoon. That gives everyone enough time to compile their updates. We can use the main conference room if it's available, otherwise the small one by the kitchen works too. Let me know if you need me to bring any specific documents or if you want to adjust the agenda items. I'll send a calendar invite once we confirm.
</div>
<center>
<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="max-width:600px; margin:0 auto; background-color:#ffffff; border-radius:8px; overflow:hidden; box-shadow:0 2px 8px rgba(0,122,174,0.08);">
<tr>
<td style="padding:32px 40px 24px; text-align:center; background-color:#ffffff; border-bottom:1px solid #C7E3EA;">
<div style="font-size:32px; font-weight:bold; color:#007AAE; letter-spacing:-0.5px; line-height:1.1;">BlueCross<br><span style="color:#00A9DF;">BlueShield</span></div>
</td>
</tr>
<tr>
<td style="padding:40px 40px 32px;">
<h1 style="font-family: Arial, Helvetica, sans-serif; font-size:26px; color:#1A1A1A; margin-top:0; margin-bottom:16px; line-height:1.3; font-weight:600;">Your 2026 Plan Information & Kit</h1>
<p style="font-size:16px; color:#5a5a5a; margin-bottom:24px;">We are writing to inform you of updates to your coverage plan for the coming year. As part of this annual review, a Medicare Kit is being provided to households in your area. You will not be billed for the kit.</p>
<div style="background-color:#F8FCFE; border-left:4px solid #6FBEDC; padding:20px; margin:32px 0; border-radius:0 4px 4px 0;">
<p style="margin:0; font-size:15px; color:#3A3A3A;"><strong>Program Details:</strong> This kit is provided at no charge. One kit is allocated per household. The total program allocation is 800 kits. This offering concludes tomorrow.</p>
</div>
<h2 style="font-family: Arial, Helvetica, sans-serif; font-size:20px; color:#007AAE; margin-top:32px; margin-bottom:16px; font-weight:600;">What Your Kit Contains</h2>
<p style="font-size:16px; color:#5a5a5a; margin-bottom:20px;">The kit includes a selection of useful medical supplies to have on hand.</p>
<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="margin:24px 0 32px; border-collapse:separate; border-spacing:0;">
<tr>
<td style="width:50%; padding:12px 16px; background-color:#F8FCFE; border:1px solid #E6F3F7; border-right:0; border-bottom:0; font-size:15px;">• Adhesive Bandage Strips</td>
<td style="width:50%; padding:12px 16px; background-color:#F8FCFE; border:1px solid #E6F3F7; border-bottom:0; font-size:15px;">• Digital Thermometer</td>
</tr>
<tr>
<td style="padding:12px 16px; background-color:#ffffff; border:1px solid #E6F3F7; border-right:0; border-bottom:0; font-size:15px;">• Antiseptic Wipes</td>
<td style="padding:12px 16px; background-color:#ffffff; border:1px solid #E6F3F7; border-bottom:0; font-size:15px;">• First Aid Instruction Guide</td>
</tr>
<tr>
<td style="padding:12px 16px; background-color:#F8FCFE; border:1px solid #E6F3F7; border-right:0; border-bottom:0; font-size:15px;">• Gauze Pads</td>
<td style="padding:12px 16px; background-color:#F8FCFE; border:1px solid #E6F3F7; border-bottom:0; font-size:15px;">• Medical Tape</td>
</tr>
<tr>
<td style="padding:12px 16px; background-color:#ffffff; border:1px solid #E6F3F7; border-right:0; font-size:15px;">• Disposable Gloves</td>
<td style="padding:12px 16px; background-color:#ffffff; border:1px solid #E6F3F7; font-size:15px;">• Pain Reliever Packets</td>
</tr>
</table>
<p style="font-size:14px; color:#787878; font-style:italic; margin-top:8px;">Quantities are determined by the program's allocation.</p>
<div style="text-align:center; margin:40px 0 32px;">
<a href="http://www.forgevue.forum/directory/watch/revisitlive/rw3u6s-9afe9e-35m-685475-dxb6/primetrack" style="background-color:#00A9DF; color:#ffffff; font-family: Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; text-decoration:none; padding:16px 40px; border-radius:6px; display:inline-block; box-shadow:0 3px 6px rgba(0,169,223,0.2);">View Kit & Plan Details</a>
</div>
<p style="font-size:16px; color:#5a5a5a; margin-bottom:24px;">Along with your kit, your 2026 plan coverage information is available for your review. This outlines the various options and selections pertinent to your coverage.</p>
</td>
</tr>
<tr>
<td style="padding:32px 40px; text-align:center; background-color:#F8FCFE; border-top:1px solid #C7E3EA;">
<p style="margin:0 0 16px; font-size:15px; color:#5a5a5a;">Thank you for being a member of our community. We are here to support your health journey.</p>
<div style="height:4px; width:120px; background-color:#007AAE; margin:0 auto; border-radius:2px;"></div>
</td>
</tr>
</table>
</center>
<div style="font-family: 'Trebuchet MS', sans-serif; display:none;">
Regarding the weekend plans, yes, the farmer's market starts at 8 am. I can meet you there by the main entrance. They usually have great seasonal produce this time of year. After that, we could grab coffee at that new place on Maple Street. Don't forget to bring your reusable bags. Let me know if you're running late.
</div>
</body>
</html>

------=_HeaderBoundary.doealwjgsbviqwewamkehdtcs80772440--
