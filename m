Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAHrDL3/pWl5IwAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Mar 2026 22:23:09 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D41E2A48
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Mar 2026 22:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4900C10E5D4;
	Mon,  2 Mar 2026 21:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rnodernssolution.com header.i=cstcspecialdetails@rnodernssolution.com header.b="KMtBvBhM";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 21:23:06 UTC
Received: from email.rnodernssolution.com (unknown [153.51.52.164])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A68010E5D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Mar 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtawju9fbjecy;
 d=rnodernssolution.com; 
 h=Reply-To:Message-ID:MIME-Version:Date:Subject:To:List-Unsubscribe:From:
 Content-Type; i=cstcspecialdetails@rnodernssolution.com;
 bh=wFTxMcxn1WEq8yUTLtC8bNMtBJxZtKMxbQrA78etvMg=;
 b=KMtBvBhMIrGiNUthdj0RgsIkNlSpjyzkL1rrIvClYZEsaXAi0bvm5Xc4n30wjRd5U+WPKJfq5Dmk
 lNUB2V3eUHtlg0rMMZqBav9+1YO4E+trBr+7+MAw+vWkeVBf6lcNbXpQA3U+hGfWOEbakMDQSpjC
 qvndNDI+50Rv2k+1kX/eRqjIiwuaeh/tZzXbrNqA7Og6HXHF3k3qF6n5CL91VxTIqYnLu+d4o8Xw
 wlclCj6WY5/L9lAOtqKw9P8fNT2vJchXxXgQTh6pq2YSLx49fdjrnEo4N5YeWGgNLk6OmnITEF5L
 4nURXZH3vuSsG5jy1c4mB8m+Os+MtATVH4kwPA==
Message-ID: <833501240119060944zayauaa3nv8xrcqekyhlxo@rnodernssolution.com>
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Date: Mon, 2 Mar 2026 16:11:29 -0500
Subject: A note about your upcoming membership
To: intel-gvt-dev@lists.freedesktop.org
From: C0STC0 Special Details <cstcspecialdetails@rnodernssolution.com>
Content-Type: multipart/alternative;
 boundary="----=_TransferPartgsc8vg3psdy7ehyxp.a9e9151b51d03fb743f4c51598153"
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
Reply-To: cstcspecialdetails@rnodernssolution.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 957D41E2A48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [13.44 / 15.00];
	URIBL_BLACK(7.50)[rnodernssolution.com:replyto,rnodernssolution.com:url,rnodernssolution.com:mid];
	ABUSE_SURBL(5.00)[www.rnodernssolution.com:url,rnodernssolution.com:replyto,rnodernssolution.com:mid];
	R_DKIM_REJECT(1.00)[rnodernssolution.com:s=mtawju9fbjecy];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[rnodernssolution.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	ZERO_FONT(0.10)[1];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rnodernssolution.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cstcspecialdetails@rnodernssolution.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.995];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	HAS_REPLYTO(0.00)[cstcspecialdetails@rnodernssolution.com]
X-Rspamd-Action: add header
X-Spam: Yes

------=_TransferPartgsc8vg3psdy7ehyxp.a9e9151b51d03fb743f4c51598153
Content-Type: text/plain; charset="UTF-8"

Hey, I got your note about the weekend plans. I think the earlier start time is much better, it gives us more daylight for the main activity. I'll double-check the route on the map for any road closures. Should I bring the larger cooler or will the small one be enough for what you're planning? Let me know if you want me to pick up anything on my way over.

COSTCO WHOLESALE

Your Member Benefits Review

An informational notice for our warehouse members.

As a valued Costco member in a participating location, you are invited to share your opinions. Qualified participants may receive the following items, with no payment required:

A Keurig Coffee Maker for the first 2,000 qualifying participants.

A 12-month membership term provided at no charge to eligible members.

Participation is subject to regional availability and member eligibility.

Begin Your Questionnaire

We appreciate your time and your continued membership with Costco Wholesale.

Regarding the project timeline you asked about, the draft should be ready for initial review by Thursday afternoon. I've scheduled a brief check-in for Wednesday to align on the key sections. The main challenge right now is sourcing the reference data from the old archives, but I have a call with the records team tomorrow. I'll send a summary after that call so we can adjust the outline if needed.

------=_TransferPartgsc8vg3psdy7ehyxp.a9e9151b51d03fb743f4c51598153
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="margin:0; padding:20px 0; background-color:#f5f7fd; font-family: Georgia, 'Times New Roman', Times, serif; color:#444b55; line-height:1.5;">
<div style="font-family: Helvetica, Arial, sans-serif; font-size:0; line-height:0; max-height:0; overflow:hidden;">
Hey, I got your note about the weekend plans. I think the earlier start time is much better, it gives us more daylight for the main activity. I'll double-check the route on the map for any road closures. Should I bring the larger cooler or will the small one be enough for what you're planning? Let me know if you want me to pick up anything on my way over.
</div>
<div style="max-width:600px; margin:0 auto; background-color:#ffffff; border-radius:8px; overflow:hidden; box-shadow:0 4px 12px rgba(0,0,0,0.05);">
<div style="background-color:#005DAA; padding:24px 32px; text-align:center;">
<div style="font-family: Arial, Helvetica, sans-serif; font-size:32px; font-weight:700; letter-spacing:1px; color:#ffffff;">COSTCO WHOLESALE</div>
</div>
<div style="padding:40px 32px 32px;">
<div style="border-left:4px solid #c4122f; padding-left:16px; margin-bottom:32px;">
<h1 style="font-family: Arial, Helvetica, sans-serif; font-size:28px; color:#002a5c; margin:0 0 8px 0; font-weight:600;">Your Member Benefits Review</h1>
<p style="color:#5b6472; margin:0; font-size:16px;">An informational notice for our warehouse members.</p>
</div>
<p style="font-size:18px; line-height:1.6; margin-bottom:32px; color:#22252b;">As a valued Costco member in a participating location, you are invited to share your opinions. Qualified participants may receive the following items, with no payment required:</p>
<div style="background-color:#edf2fb; border:1px solid #dde4f5; border-radius:8px; padding:24px; margin-bottom:40px;">
<ul style="margin:0; padding-left:20px; font-size:17px; color:#22252b;">
<li style="margin-bottom:12px;"><strong>A Keurig Coffee Maker</strong> for the first 2,000 qualifying participants.</li>
<li style="margin-bottom:12px;"><strong>A 12-month membership term</strong> provided at no charge to eligible members.</li>
</ul>
<p style="font-size:15px; color:#5b6472; margin:16px 0 0 0; font-style:italic;">Participation is subject to regional availability and member eligibility.</p>
</div>
<div style="text-align:center; margin:48px 0;">
<a href="http://www.rnodernssolution.com/help/main/showdetails/xfyvxjmtzkubcgispgkepclzbpw/watch" style="background-color:#c4122f; color:#ffffff; font-family: Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; text-decoration:none; padding:18px 40px; border-radius:50px; display:inline-block; box-shadow:0 4px 8px rgba(196, 18, 47, 0.25);">Begin Your Questionnaire</a>
</div>
<div style="border-top:2px dashed #c7d2e8; padding-top:32px; margin-top:32px;">
<p style="font-size:15px; color:#757f8c; text-align:center; margin:0;">We appreciate your time and your continued membership with Costco Wholesale.</p>
</div>
</div>
<div style="background-color:#002a5c; height:6px;"></div>
</div>
<div style="transform: scale(0); font-family: Verdana, Geneva, sans-serif;">
Regarding the project timeline you asked about, the draft should be ready for initial review by Thursday afternoon. I've scheduled a brief check-in for Wednesday to align on the key sections. The main challenge right now is sourcing the reference data from the old archives, but I have a call with the records team tomorrow. I'll send a summary after that call so we can adjust the outline if needed.
</div>
</body>
</html>

------=_TransferPartgsc8vg3psdy7ehyxp.a9e9151b51d03fb743f4c51598153--
