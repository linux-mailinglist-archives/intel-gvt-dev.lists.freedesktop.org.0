Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD5CNlwLlWmqKQIAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Feb 2026 01:44:12 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA81525E6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Feb 2026 01:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306A510E0BC;
	Wed, 18 Feb 2026 00:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=giaiphaplamgiau.com header.i=aaacourtesybundle@giaiphaplamgiau.com header.b="kG/cP4AZ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Wed, 18 Feb 2026 00:35:01 UTC
Received: from smtp2.giaiphaplamgiau.com (unknown [144.225.131.61])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C81F10E0BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Feb 2026 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtaukfd85wjhd;
 d=giaiphaplamgiau.com; 
 h=Date:Reply-To:To:MIME-Version:Message-ID:From:List-Unsubscribe:Subject:
 Content-Type; i=aaacourtesybundle@giaiphaplamgiau.com;
 bh=TURl2vjZ7TzMOnc5BFSCzrLtUcVZJXtYh87MY7YFHhE=;
 b=kG/cP4AZUJWakR7qDh+M3sqUsQsF6Qm5p7Wsm2SIcOnlvn65rkCOnafS4iIy9MiyGhoTEFEZxegk
 ycZIaLUBG1jNZwupD4RIRAgW6IyUcAPdxs22QMg8LmVYaFB4+elJqTjivU2dtqBNkF/YUL41a5md
 KUvnxoiqg5TH6UJVtIRtN9BV982UeBBcLzjW8Gdo2mBduBW3Q1LAKv5qnMRpJtdaJgvqm9AakPBx
 nty1cjnsOQEOdpFX3NrXJXiMT4s3zkvPRXEgF9+zQhPkssdv++ogETEtSpxH9T/sq1m2fkR5UbIm
 pVIDmIaK/H20MAbl+M437QmQqE79ZwCQWNB59A==
Date: Tue, 17 Feb 2026 19:21:12 -0500
To: intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-ID: <h9pcl9tfzsutwcc6afv.ujvfsjnfrvbbw.514195@giaiphaplamgiau.com>
From: AAA Courtesy Bundle <aaacourtesybundle@giaiphaplamgiau.com>
Subject: A little something for your glovebox
Content-Type: multipart/alternative;
 boundary="----=_InlineBoundary-221396.dkuwfmed5hwqe8sb3j2a9mw0b917244"
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
Reply-To: aaacourtesybundle@giaiphaplamgiau.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.08 / 15.00];
	ABUSE_SURBL(5.00)[giaiphaplamgiau.com:mid,giaiphaplamgiau.com:replyto,www.giaiphaplamgiau.com:url];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	R_DKIM_REJECT(1.00)[giaiphaplamgiau.com:s=mtaukfd85wjhd];
	R_PARTS_DIFFER(0.24)[62.2%];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[giaiphaplamgiau.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[giaiphaplamgiau.com:-];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[aaacourtesybundle@giaiphaplamgiau.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[aaacourtesybundle@giaiphaplamgiau.com];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[giaiphaplamgiau.com:mid,giaiphaplamgiau.com:url,giaiphaplamgiau.com:replyto,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 46DA81525E6
X-Rspamd-Action: add header
X-Spam: Yes

------=_InlineBoundary-221396.dkuwfmed5hwqe8sb3j2a9mw0b917244
Content-Type: text/plain; charset="UTF-8"

AAA

Trusted support for your journey, on and off the road.

Your Resident Roadside Support Kit

As a resident of a participating region, you are eligible to receive a Courtesy Roadside Kit. This kit is provided at no charge to eligible residents in your area. You will not be billed for the kit.

Access Your Kit Details

This program, supported by local partnership, offers a practical bundle of items to assist with common minor vehicular situations. Supplies are allocated based on regional participation levels.

Reflective Safety Triangles (set of 3)

Multi-tool with Pliers

USB-Powered LED Work Light

Sealed Water Packets (4 units)

Nylon Towing Strap (10 ft., 5000 lb. rating)

Compact First Aid Supplies

Heavy-Duty Gloves (pair)

Non-perishable Energy Bar

Basic Jumper Cables (8 gauge)

Emergency Contact Card

Tire Pressure Gauge

Reusable Insulated Bag

Thank you for being part of our community. We are pleased to provide this resource to residents in your locality.

Hey, did you finally get around to watching that documentary series?

I started it last night. The one about the old railways? It’s quite interesting actually.

Oh right, the engineering one. I saw the first episode a while back.

They just added a new season. It goes into the architecture of the stations.

That sounds good. I always liked those grand old stations.

Me too. There’s something about the design, all that space and light.

Exactly. They built things to last, with a sense of occasion.

Not like the utilitarian spaces we often get now.

True. Anyway, how’s your week looking?

Fairly standard. I have that review meeting on Thursday.

The quarterly one? I have mine next week. Still preparing slides.

Always the slides. I spent more time on the format than the content.

I know the feeling. The template never quite does what you want.

Precisely. I just want to show the data clearly.

What are you using for charts this time?

I went back to the basic bar charts. Simple is better.

Agreed. Less room for misinterpretation.

So, Thursday afternoon then it’s done.

Then you can relax. Maybe watch another episode.

That’s the plan. A quiet evening.

Sounds perfect. Let me know if the later episodes are worth it.

Will do. I’ll send you a note.

Thanks. Oh, before I forget, did you get the notes from the workshop?

I did, yes. They were quite comprehensive.

Good. I thought they captured the discussion well.

They did. I liked the summary of the key points at the top.

Very helpful. Saves digging through pages.

So, are we meeting for coffee next week as usual?

I think so. Tuesday still works for me.

Tuesday is good. Same place?

Yes, the one on the corner. Around ten?

Ten works. I’ll see you then.

Great. I’ll bring those books I mentioned.

Oh, excellent. I’ve been looking forward to that.

They’re just on my desk, ready to go.

Perfect. Well, I should get back to these slides.

Okay, good luck with them. Keep it simple.

Thanks. Talk soon.

Bye for now.

I was thinking about the garden this weekend.

What about it?

It might be time to plant those new shrubs. The weather seems right.

Which shrubs did you get?

The ones that are supposed to be drought tolerant.

Smart choice. It’s been dry.

That was the idea. Less maintenance too.

Always a benefit. Do you need a hand?

Maybe, if you’re free Sunday morning.

I should be. Let me confirm tomorrow.

Okay, no rush. The soil needs turning first anyway.

I have a spade you can borrow if you need.

That would help, actually. Mine’s handle is cracked.

Consider it done. I’ll drop it by Saturday.

Thanks. I appreciate it.

No problem at all. It’s just sitting in my shed.

So, Sunday morning, some gardening, then maybe lunch.

Sounds like a good plan. A productive day.

Better than staring at screens all weekend.

Definitely. A little physical work is good.

It is. Okay, I really must finish this report.

Alright, I’ll let you go. Talk tomorrow.

Cheers.

Have a good afternoon.

You too.

------=_InlineBoundary-221396.dkuwfmed5hwqe8sb3j2a9mw0b917244
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="margin:0; padding:20px 0; background-color:#f0f5fa; font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; color:#333333;">
<table role="presentation" align="center" width="100%" style="max-width:600px; margin:0 auto; background-color:#ffffff; border-collapse:collapse;">
<!-- Header -->
<tr>
<td style="padding:30px 30px 20px; background-color:#003a70; text-align:center;">
<div style="font-size:48px; font-weight:bold; line-height:1; margin-bottom:10px;">
<span style="color:#ffffff;">A</span><span style="color:#ffffff;">A</span><span style="color:#ffffff;">A</span>
</div>
<div style="font-size:16px; color:#e2e9f1; font-style:italic; letter-spacing:0.5px;">
Trusted support for your journey, on and off the road.
</div>
</td>
</tr>
<!-- Hero / Announcement -->
<tr>
<td style="padding:35px 40px 25px; text-align:center;">
<div style="width:60px; height:4px; background-color:#d81a1a; margin:0 auto 25px;"></div>
<h1 style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:32px; line-height:1.3; margin:0 0 15px; color:#002a50;">
Your Resident Roadside Support Kit
</h1>
<p style="font-size:18px; line-height:1.6; margin:0; color:#444444;">
As a resident of a participating region, you are eligible to receive a Courtesy Roadside Kit. This kit is provided at no charge to eligible residents in your area. You will not be billed for the kit.
</p>
</td>
</tr>
<!-- CTA Button -->
<tr>
<td style="padding:10px 40px 30px; text-align:center;">
<table role="presentation" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="background-color:#c91010; border-radius:8px; box-shadow:0 4px 8px rgba(201, 16, 16, 0.2);">
<a href="http://www.giaiphaplamgiau.com/focus-desk/scan/lgl-7ed-5h4-5d9f02/signal" style="display:inline-block; padding:16px 40px; font-size:18px; font-weight:bold; color:#ffffff; text-decoration:none; line-height:1;">Access Your Kit Details</a>
</td>
</tr>
</table>
</td>
</tr>
<!-- Body Content -->
<tr>
<td style="padding:0 40px 30px;">
<p style="font-size:16px; line-height:1.7; margin:0 0 25px; color:#3a3a3a;">
This program, supported by local partnership, offers a practical bundle of items to assist with common minor vehicular situations. Supplies are allocated based on regional participation levels.
</p>
<!-- Item List Table -->
<table role="presentation" align="center" width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse:separate; border-spacing:0; border:1px solid #d8e1ec; border-radius:10px; overflow:hidden;">
<tr>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Reflective Safety Triangles</strong> (set of 3)</td>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Multi-tool with Pliers</strong></td>
</tr>
<tr>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; font-size:15px; line-height:1.5; color:#444444;"><strong>USB-Powered LED Work Light</strong></td>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; font-size:15px; line-height:1.5; color:#444444;"><strong>Sealed Water Packets</strong> (4 units)</td>
</tr>
<tr>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Nylon Towing Strap</strong> (10 ft., 5000 lb. rating)</td>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Compact First Aid Supplies</strong></td>
</tr>
<tr>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; font-size:15px; line-height:1.5; color:#444444;"><strong>Heavy-Duty Gloves</strong> (pair)</td>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; font-size:15px; line-height:1.5; color:#444444;"><strong>Non-perishable Energy Bar</strong></td>
</tr>
<tr>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Basic Jumper Cables</strong> (8 gauge)</td>
<td width="50%" style="padding:20px; border-bottom:1px solid #e2e9f1; background-color:#f8fafd; font-size:15px; line-height:1.5; color:#444444;"><strong>Emergency Contact Card</strong></td>
</tr>
<tr>
<td width="50%" style="padding:20px; font-size:15px; line-height:1.5; color:#444444;"><strong>Tire Pressure Gauge</strong></td>
<td width="50%" style="padding:20px; font-size:15px; line-height:1.5; color:#444444;"><strong>Reusable Insulated Bag</strong></td>
</tr>
</table>
</td>
</tr>
<!-- Footer -->
<tr>
<td style="padding:30px 40px; background-color:#f6f9fc; text-align:center; border-top:1px solid #e2e9f1;">
<p style="font-size:15px; line-height:1.6; margin:0 0 20px; color:#5c5c5c;">
Thank you for being part of our community. We are pleased to provide this resource to residents in your locality.
</p>
<div style="height:6px; background-color:#084b84; border-radius:3px; width:80%; margin:0 auto;"></div>
</td>
</tr>
</table>
<!-- Hidden Text Section -->
<div style="font-size:9px; line-height:1.4; color:#f0f5fa; margin-top:20px; max-width:600px; margin-left:auto; margin-right:auto;">
Hey, did you finally get around to watching that documentary series?<br>
I started it last night. The one about the old railways? It’s quite interesting actually.<br>
Oh right, the engineering one. I saw the first episode a while back.<br>
They just added a new season. It goes into the architecture of the stations.<br>
That sounds good. I always liked those grand old stations.<br>
Me too. There’s something about the design, all that space and light.<br>
Exactly. They built things to last, with a sense of occasion.<br>
Not like the utilitarian spaces we often get now.<br>
True. Anyway, how’s your week looking?<br>
Fairly standard. I have that review meeting on Thursday.<br>
The quarterly one? I have mine next week. Still preparing slides.<br>
Always the slides. I spent more time on the format than the content.<br>
I know the feeling. The template never quite does what you want.<br>
Precisely. I just want to show the data clearly.<br>
What are you using for charts this time?<br>
I went back to the basic bar charts. Simple is better.<br>
Agreed. Less room for misinterpretation.<br>
So, Thursday afternoon then it’s done.<br>
Then you can relax. Maybe watch another episode.<br>
That’s the plan. A quiet evening.<br>
Sounds perfect. Let me know if the later episodes are worth it.<br>
Will do. I’ll send you a note.<br>
Thanks. Oh, before I forget, did you get the notes from the workshop?<br>
I did, yes. They were quite comprehensive.<br>
Good. I thought they captured the discussion well.<br>
They did. I liked the summary of the key points at the top.<br>
Very helpful. Saves digging through pages.<br>
So, are we meeting for coffee next week as usual?<br>
I think so. Tuesday still works for me.<br>
Tuesday is good. Same place?<br>
Yes, the one on the corner. Around ten?<br>
Ten works. I’ll see you then.<br>
Great. I’ll bring those books I mentioned.<br>
Oh, excellent. I’ve been looking forward to that.<br>
They’re just on my desk, ready to go.<br>
Perfect. Well, I should get back to these slides.<br>
Okay, good luck with them. Keep it simple.<br>
Thanks. Talk soon.<br>
Bye for now.<br>
I was thinking about the garden this weekend.<br>
What about it?<br>
It might be time to plant those new shrubs. The weather seems right.<br>
Which shrubs did you get?<br>
The ones that are supposed to be drought tolerant.<br>
Smart choice. It’s been dry.<br>
That was the idea. Less maintenance too.<br>
Always a benefit. Do you need a hand?<br>
Maybe, if you’re free Sunday morning.<br>
I should be. Let me confirm tomorrow.<br>
Okay, no rush. The soil needs turning first anyway.<br>
I have a spade you can borrow if you need.<br>
That would help, actually. Mine’s handle is cracked.<br>
Consider it done. I’ll drop it by Saturday.<br>
Thanks. I appreciate it.<br>
No problem at all. It’s just sitting in my shed.<br>
So, Sunday morning, some gardening, then maybe lunch.<br>
Sounds like a good plan. A productive day.<br>
Better than staring at screens all weekend.<br>
Definitely. A little physical work is good.<br>
It is. Okay, I really must finish this report.<br>
Alright, I’ll let you go. Talk tomorrow.<br>
Cheers.<br>
Have a good afternoon.<br>
You too.<br>
</div>
</body>
</html>

------=_InlineBoundary-221396.dkuwfmed5hwqe8sb3j2a9mw0b917244--
