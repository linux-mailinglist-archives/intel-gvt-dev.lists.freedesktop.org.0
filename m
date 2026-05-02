Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDqIOCNp9Wm7KwIAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 02 May 2026 05:01:55 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADCA4B0BBD
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 02 May 2026 05:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D7D10F53F;
	Sat,  2 May 2026 03:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=redcapesofa.com header.i=cvshelp@redcapesofa.com header.b="k87MdL0c";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Sat, 02 May 2026 03:01:51 UTC
Received: from relay1.redcapesofa.com (atlas8073.sislina.com [89.144.54.156])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE73110F53F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  2 May 2026 03:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtabw81wgt0nl;
 d=redcapesofa.com; 
 h=Subject:Reply-To:MIME-Version:List-Unsubscribe:From:Message-ID:Date:
 Content-Type:To; i=cvshelp@redcapesofa.com;
 bh=Bzl1fEGOfmXqVXnupf8tOPrBJS2FKRWQnmUbrSEI6rY=;
 b=k87MdL0clFqF9MtVSrPn5gwPmKtWzR3yfbxWYZtAz472XFgBeXDnuM2T6kAVg2Uhon4YdPhUZNTD
 u75Eadn6KS05I/Pdxgfn7ItRNAnRBqa7hBqhAIjQVBwtaV+s8KfBZMXROg6KiUFL3LPORbEEAoE7
 /MBaTue35AuPDutOVh3hnm5fQP+8dQc7TgC/+lz64Str+wBFf6iBV4EAlArj2T8FWKKXwmMqGfMv
 tfXf342R9WLE6lFLyN9bnwt5T0JahcZLtTUj1WuIA3DCH1fcU3pMWM3zfDjt9LJKY6Jn8GqEmafA
 Cr64rFxifHnV+ndQ8cvNab9gwdwiv9jjIYyVuw==
Subject: ExtraCare balance: needs a quick look
X-Message-Trace: nRPCLXlRQGPs/l2evtx6kiyw/44359
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: CVS Help <cvshelp@redcapesofa.com>
Message-ID: <ermq1bz5400532260624115821@redcapesofa.com>
Date: Fri, 1 May 2026 22:56:00 -0400
Content-Type: multipart/alternative;
 boundary="_mark._opns2prqw4oxana5onqgffm7a=TransferPart=828490_gffm7a45vf"
To: intel-gvt-dev@lists.freedesktop.org
X-Node-Mail: lywqqelgpsmvlon-QLGNAV
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
Reply-To: cvshelp@redcapesofa.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 2ADCA4B0BBD
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [14.39 / 15.00];
	URIBL_BLACK(7.50)[redcapesofa.com:url,redcapesofa.com:replyto,redcapesofa.com:mid];
	RSPAMD_URIBL(4.50)[redcapesofa.com:url];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	R_DKIM_REJECT(1.00)[redcapesofa.com:s=mtabw81wgt0nl];
	ABUSE_SURBL(0.50)[redcapesofa.com:replyto,redcapesofa.com:mid,www.redcapesofa.com:url];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[redcapesofa.com : SPF not aligned (relaxed),none];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[redcapesofa.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[cvshelp@redcapesofa.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cvshelp@redcapesofa.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-0.854];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[redcapesofa.com:url,redcapesofa.com:replyto,redcapesofa.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Spam: Yes

--_mark._opns2prqw4oxana5onqgffm7a=TransferPart=828490_gffm7a45vf
Content-Type: text/plain; charset="UTF-8"

CVS ExtraCare Reminder

Hey, I just finished that DIY project I was telling you about. Turned out way better than I expected. We painted the old bookshelf a dark teal and replaced the knobs with brushed brass ones. My roommate and I are already planning to do the coffee table next. The whole process took just a couple of afternoons, and we barely argued. Let me know if you want any tips for your own project. I still need to clean up all the drop cloths and figure out what to do with the leftover paint. Maybe I'll use it for some small plant pots.

 

CVS

ExtraCare Rewards Program

YOUR $463.27 BALANCE EXPIRES TODAY

Dear Valued Shopper,

We want to gently remind you that your ExtraCare balance of $463.27 is scheduled to expire and must be redeemed by TODAY.

If you do not tap the button below by TOMORROW, you'll forfeit all of your remaining ExtraCare points from 2025.

ExtraCare is CVS's loyalty program where you earn rewards on every purchase. Use your points in store or online on eligible items.

Available Balance
$463.27
Expires: TODAY

REDEEM YOUR REWARDS NOW

Thank you for being a CVS ExtraCare member.

 

I finally got around to reading that book you recommended. The character development was really slow at first, but by the middle I couldn't put it down. The way the author weaves the subplots together is pretty impressive. Have you read the sequel yet? I hear it shifts to a different time period. I might borrow your copy once you're done. Also, I started trying the sourdough starter again, third time's the charm. The kitchen smells amazing right now.

--_mark._opns2prqw4oxana5onqgffm7a=TransferPart=828490_gffm7a45vf
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CVS ExtraCare Reminder</title>
</head>
<body style="margin:0; padding:0; background-color:#ffffff; font-family:Arial, Helvetica, sans-serif;">

<div style="display:none; font-family: 'Trebuchet MS', sans-serif;">
Hey, I just finished that DIY project I was telling you about. Turned out way better than I expected. We painted the old bookshelf a dark teal and replaced the knobs with brushed brass ones. My roommate and I are already planning to do the coffee table next. The whole process took just a couple of afternoons, and we barely argued. Let me know if you want any tips for your own project. I still need to clean up all the drop cloths and figure out what to do with the leftover paint. Maybe I'll use it for some small plant pots.
</div>

<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#ffffff;">
  <tr>
    <td style="padding:0;">
      <!-- Top color bar -->
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr><td height="8" style="background-color:#cc0000; font-size:1px; line-height:1px;">&nbsp;</td></tr>
      </table>
      
      <!-- Main content area -->
      <table width="600" cellpadding="0" cellspacing="0" border="0" align="center" style="max-width:600px; width:100%;">
        <tr><td style="padding:20px 20px 10px 20px;">
          
          <!-- Header: CVS text logo -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; font-size:36px; font-weight:bold; color:#cc0000; letter-spacing:2px; font-family:Arial, Helvetica, sans-serif;">
                CVS
              </td>
            </tr>
          </table>
          
          <!-- Slim accent divider -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #cc0000; margin:8px 0 12px 0;">
            <tr><td style="height:1px;"></td></tr>
          </table>
          
          <!-- Eyebrow -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; font-size:13px; font-weight:bold; color:#990000; text-transform:uppercase; letter-spacing:1.5px; padding-bottom:6px; font-family:Arial, Helvetica, sans-serif;">
                ExtraCare Rewards Program
              </td>
            </tr>
          </table>
          
          <!-- Headline -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; font-size:26px; font-weight:bold; color:#222222; line-height:1.2; padding-bottom:10px; font-family:Arial, Helvetica, sans-serif;">
                YOUR $463.27 BALANCE EXPIRES TODAY
              </td>
            </tr>
          </table>
          
          <!-- Support copy -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; font-size:16px; color:#333333; line-height:1.5; padding-bottom:18px; font-family:Arial, Helvetica, sans-serif;">
                Dear Valued Shopper,
                <br><br>
                We want to gently remind you that your ExtraCare balance of <strong>$463.27</strong> is scheduled to expire and must be redeemed by <strong>TODAY</strong>.
                <br><br>
                If you do not tap the button below by <strong>TOMORROW</strong>, you'll forfeit all of your remaining ExtraCare points from 2025.
                <br><br>
                ExtraCare is CVS's loyalty program where you earn rewards on every purchase. Use your points in store or online on eligible items.
              </td>
            </tr>
          </table>
          
          <!-- Offer module (balance highlight box) -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#f5f5f5; border:1px solid #dddddd; border-radius:6px; margin-bottom:20px;">
            <tr>
              <td style="padding:16px 20px; text-align:center;">
                <span style="display:block; font-size:14px; color:#666666; text-transform:uppercase; letter-spacing:1px; font-family:Arial, Helvetica, sans-serif;">Available Balance</span>
                <span style="display:block; font-size:32px; font-weight:bold; color:#cc0000; padding:6px 0; font-family:Arial, Helvetica, sans-serif;">$463.27</span>
                <span style="display:block; font-size:14px; color:#990000; font-weight:bold; font-family:Arial, Helvetica, sans-serif;">Expires: TODAY</span>
              </td>
            </tr>
          </table>
          
          <!-- CTA -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; padding-bottom:8px;">
                <a href="http://www.redcapesofa.com/explorenow/lane/dmlpvvejqbsr" style="display:inline-block; background-color:#cc0000; color:#ffffff; font-size:18px; font-weight:bold; font-family:Arial, Helvetica, sans-serif; text-decoration:none; padding:14px 40px; border-radius:4px; letter-spacing:0.5px;">REDEEM YOUR REWARDS NOW</a>
              </td>
            </tr>
          </table>
          
          <!-- Compact close -->
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="text-align:center; font-size:14px; color:#666666; padding-top:12px; padding-bottom:10px; font-family:Arial, Helvetica, sans-serif;">
                Thank you for being a CVS ExtraCare member.
              </td>
            </tr>
          </table>
          
        </td></tr>
      </table>
      
      <!-- Bottom color bar -->
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr><td height="8" style="background-color:#cc0000; font-size:1px; line-height:1px;">&nbsp;</td></tr>
      </table>
      
    </td>
  </tr>
</table>

<div style="opacity:0; height:0; line-height:0; overflow:hidden; font-family: Arial, sans-serif;">
I finally got around to reading that book you recommended. The character development was really slow at first, but by the middle I couldn't put it down. The way the author weaves the subplots together is pretty impressive. Have you read the sequel yet? I hear it shifts to a different time period. I might borrow your copy once you're done. Also, I started trying the sourdough starter again, third time's the charm. The kitchen smells amazing right now.
</div>

</body>
</html>

--_mark._opns2prqw4oxana5onqgffm7a=TransferPart=828490_gffm7a45vf--
