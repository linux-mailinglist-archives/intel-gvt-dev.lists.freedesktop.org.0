Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OUeKlv8pWnvIgAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Mar 2026 22:08:43 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39D1E1D12
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Mar 2026 22:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7510E5CE;
	Mon,  2 Mar 2026 21:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=vebpropin.com header.i=bluecrossandblueshield@vebpropin.com header.b="VY028AE6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 21:08:40 UTC
Received: from mx2.vebpropin.com (mail.vebpropin.com [147.189.169.195])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79BE710E5CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Mar 2026 21:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtap6ss68pdyo;
 d=vebpropin.com; 
 h=MIME-Version:Reply-To:Subject:List-Unsubscribe:Date:To:Message-ID:From:
 Content-Type; i=bluecrossandblueshield@vebpropin.com;
 bh=Fr51BA1NMZd1xm1YJ42Q5D5C9US14ne23QTeTVm05vM=;
 b=VY028AE6OGFHF/ZDRqNIGJSf9YQ5PJRX/vAzfzp8cfvIt7zHkJjXotOOOKUES/7WxR6PEmZO7i9t
 vklcB2SsRuAzHqW6N4TJIn1JTHrXvFcE32mXgd36NtHIBebH5U2xFRuY9yD1DiFcPUwhLca7eJNm
 fhWWjzqx4I8flHTCTk8uVVPk2PgCzFj3BF7yo5yewm6i3+EGP7f03Ti8qXyrR8kNW23CGRFD1R+C
 ilrENZu6bvFbH2Mp9ZkHQL4BN+kqDUUTHJHJlUmtmOZjw3zWeGncW2UA8yg8bViM0hBrc1c8aN95
 AwaOee/iG/aI4/6q7VOJUrOhnlgz44Pk0HiaBQ==
MIME-Version: 1.0
Subject: Your 2026 plan has been updated
Date: Mon, 2 Mar 2026 16:02:05 -0500
To: intel-gvt-dev@lists.freedesktop.org
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-ID: <0441747.e9fc3f24-cr5myx@vebpropin.com>
From: BlueCross and BlueShield <bluecrossandblueshield@vebpropin.com>
Content-Type: multipart/alternative;
 boundary="----=_Chunk_obwnwfzjudid-20569515"
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
Reply-To: bluecrossandblueshield@vebpropin.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0A39D1E1D12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.99 / 15.00];
	ABUSE_SURBL(5.00)[www.vebpropin.com:url,vebpropin.com:replyto,vebpropin.com:mid];
	R_DKIM_REJECT(1.00)[vebpropin.com:s=mtap6ss68pdyo];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[vebpropin.com : SPF not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MANY_INVISIBLE_PARTS(0.10)[2];
	ZERO_FONT(0.10)[1];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	GREYLIST(0.00)[pass,meta];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[vebpropin.com:-];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[bluecrossandblueshield@vebpropin.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bluecrossandblueshield@vebpropin.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.998];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,vebpropin.com:replyto,vebpropin.com:url,vebpropin.com:mid]
X-Rspamd-Action: no action

------=_Chunk_obwnwfzjudid-20569515
Content-Type: text/plain; charset="UTF-8"

I think the meeting with the design team went well. The new layout concepts are much cleaner. We should focus on the user flow for the onboarding section next. Could you pull the analytics from last quarter for comparison? I'll draft a summary of the feedback we received. Let's aim to have a revised prototype by Wednesday afternoon if possible. That should give us enough time for internal review before the client check-in.

BlueCross
BlueShield

Your 2026 Plan Update & Kit

We are writing to inform you of changes to your coverage plan for the upcoming year. Along with this update, a Medicare Kit is being provided to households in your area. You will not be billed for the kit.

Program Details: This kit is provided at no charge. One kit is available per household. The total allocation for this program is 800 kits. This offering concludes tomorrow.

View Kit + Plan Details

What Your Kit Contains

Digital Thermometer

Blood Pressure Monitor

First-Aid Supplies

Hand Sanitizer (4 oz.)

Medical-Grade Bandages

Disposable Face Masks

Pain Relief Ointment

Antiseptic Wipes

Quantities are determined by program allocation.

Your plan for 2026 includes various options that need to be selected. The enclosed information outlines these updates to help you understand the changes.

Thank you for your membership. We are here to support your health journey.

Regarding the project timeline, yes, we can adjust the deliverables for phase two. The client's request for additional user testing makes sense. We'll need to coordinate with the research team to book the lab. I've asked Sam to draft the updated schedule. Let me know if you want to review it together before we send it out. We might also consider a brief check-in call with the main stakeholders to align expectations.

------=_Chunk_obwnwfzjudid-20569515
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="margin:0; padding:20px 0; background-color:#E6F3F7; font-family: Arial, Helvetica, sans-serif; color:#3A3A3A; line-height:1.5;">
<div style="font-family: Helvetica, Arial, sans-serif; font-size:0; line-height:0; max-height:0; overflow:hidden;">
I think the meeting with the design team went well. The new layout concepts are much cleaner. We should focus on the user flow for the onboarding section next. Could you pull the analytics from last quarter for comparison? I'll draft a summary of the feedback we received. Let's aim to have a revised prototype by Wednesday afternoon if possible. That should give us enough time for internal review before the client check-in.
</div>
<center>
<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="max-width:600px; margin:0 auto; background-color:#ffffff; border-radius:8px; overflow:hidden; box-shadow:0 2px 8px rgba(0,122,174,0.08);">
<tr>
<td style="padding:30px 30px 20px; text-align:center; border-bottom:1px solid #C7E3EA;">
<div style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:32px; font-weight:bold; color:#007AAE; letter-spacing:-0.5px; line-height:1.1;">BlueCross<br><span style="color:#00A9DF;">BlueShield</span></div>
</td>
</tr>
<tr>
<td style="padding:30px 30px 10px;">
<h1 style="font-family: Arial, Helvetica, sans-serif; font-size:26px; color:#1A1A1A; margin-top:0; margin-bottom:15px; font-weight:600; line-height:1.3;">Your 2026 Plan Update & Kit</h1>
<p style="margin-top:0; margin-bottom:20px; font-size:16px; color:#5a5a5a;">We are writing to inform you of changes to your coverage plan for the upcoming year. Along with this update, a Medicare Kit is being provided to households in your area. You will not be billed for the kit.</p>
<div style="background-color:#F8FCFD; border-left:4px solid #6FBEDC; padding:15px 20px; margin:25px 0; border-radius:0 4px 4px 0;">
<p style="margin:0; font-size:15px; color:#3A3A3A;"><strong>Program Details:</strong> This kit is provided at no charge. One kit is available per household. The total allocation for this program is 800 kits. This offering concludes tomorrow.</p>
</div>
</td>
</tr>
<tr>
<td style="padding:0 30px 25px;">
<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td align="center">
<a href="http://www.vebpropin.com/briefingview/map/access/5ff9bb1b06297e1196a18c1b1/weekly_track" style="background-color:#00A9DF; color:#ffffff; text-decoration:none; font-weight:bold; font-size:17px; padding:16px 40px; border-radius:6px; display:inline-block; box-shadow:0 3px 5px rgba(0,169,223,0.2);">View Kit + Plan Details</a>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="padding:0 30px 30px;">
<h2 style="font-family: Arial, Helvetica, sans-serif; font-size:20px; color:#1A1A1A; margin-top:0; margin-bottom:20px; padding-bottom:10px; border-bottom:2px solid #A3D8EB;">What Your Kit Contains</h2>
<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:separate; border-spacing:0 10px;">
<tr>
<td width="48%" style="background-color:#F8FCFD; padding:15px; border:1px solid #E6F3F7; border-radius:6px; vertical-align:top;">
<ul style="margin:0; padding-left:20px; color:#5a5a5a; font-size:15px;">
<li>Digital Thermometer</li>
<li>Blood Pressure Monitor</li>
<li>First-Aid Supplies</li>
<li>Hand Sanitizer (4 oz.)</li>
</ul>
</td>
<td width="4%"></td>
<td width="48%" style="background-color:#F8FCFD; padding:15px; border:1px solid #E6F3F7; border-radius:6px; vertical-align:top;">
<ul style="margin:0; padding-left:20px; color:#5a5a5a; font-size:15px;">
<li>Medical-Grade Bandages</li>
<li>Disposable Face Masks</li>
<li>Pain Relief Ointment</li>
<li>Antiseptic Wipes</li>
</ul>
</td>
</tr>
</table>
<p style="font-size:14px; color:#787878; margin-top:20px; font-style:italic;">Quantities are determined by program allocation.</p>
</td>
</tr>
<tr>
<td style="padding:0 30px 30px;">
<p style="font-size:16px; color:#5a5a5a; margin-top:0; margin-bottom:20px;">Your plan for 2026 includes various options that need to be selected. The enclosed information outlines these updates to help you understand the changes.</p>
</td>
</tr>
<tr>
<td style="padding:30px; background-color:#007AAE; text-align:center;">
<p style="margin:0; font-size:15px; color:#ffffff;">Thank you for your membership. We are here to support your health journey.</p>
</td>
</tr>
</table>
</center>
<div style="font-family: 'Trebuchet MS', sans-serif; display:none;">
Regarding the project timeline, yes, we can adjust the deliverables for phase two. The client's request for additional user testing makes sense. We'll need to coordinate with the research team to book the lab. I've asked Sam to draft the updated schedule. Let me know if you want to review it together before we send it out. We might also consider a brief check-in call with the main stakeholders to align expectations.
</div>
</body>
</html>

------=_Chunk_obwnwfzjudid-20569515--
