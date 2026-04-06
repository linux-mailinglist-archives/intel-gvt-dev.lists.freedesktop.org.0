Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJkOAQ8G1Gk9pwcAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 06 Apr 2026 21:14:23 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF63A68B9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 06 Apr 2026 21:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C510E221;
	Mon,  6 Apr 2026 19:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rtpbolaslotkita.com header.i=fedexpackage@rtpbolaslotkita.com header.b="h3kPVMmk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Mon, 06 Apr 2026 19:07:02 UTC
Received: from track.rtpbolaslotkita.com (22.104.99.93.finalhosting.cz
 [93.99.104.22])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45BA710E221
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Apr 2026 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtaj0nzpnenjn;
 d=rtpbolaslotkita.com; 
 h=Subject:Reply-To:To:Message-ID:MIME-Version:Date:From:List-Unsubscribe:
 Content-Type; i=fedexpackage@rtpbolaslotkita.com;
 bh=D1fj+sHWPInbWOT872SbQH9JZFlJSInmsqrFTIxuLt0=;
 b=h3kPVMmkgRXOY+ijNk3ucQANSrkx9545/rrgY0uOJslKtKoJin62YoloCexV45W8dGEICtXVcIjD
 FaXYpplD/H4+aY8mlXMTzx95t+Hr7k9KNKvog7MK9bSngqWoNAhmcXDV+IlIT9szc1aOVoMG7kk0
 h93Wuwxv0CFejquDfKBnTnftiSDWFY3vPYzN7Z7wMC7BrnLmcYIYtHL8GMupvQdZ3fTmuQdeYyQO
 YoLYWHo9Fdacb2rwA13DaTc1gw7JpQA0gpZ07MQx95Eg0nj6U1hycuPlmYhNqty9eCq2rQ2Xs0Sl
 Zb7tlya77hNKQ7E69vZdR2ARgRtYV2AJ/HdgVg==
Subject: Lost package or return to sender, FedEx delivery notice
To: intel-gvt-dev@lists.freedesktop.org
Message-ID: <20250403064239-636978bwevqxu@rtpbolaslotkita.com>
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Date: Mon, 6 Apr 2026 14:49:02 -0400
From: FedEx Package <fedexpackage@rtpbolaslotkita.com>
Content-Type: multipart/alternative;
 boundary="----=_TransferPartpjgm5q08rhv3iiid8_eae142c804e66523ef2d0644247"
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
Reply-To: fedexpackage@rtpbolaslotkita.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [14.34 / 15.00];
	URIBL_BLACK(7.50)[rtpbolaslotkita.com:replyto,rtpbolaslotkita.com:mid,rtpbolaslotkita.com:url];
	ABUSE_SURBL(5.00)[www.rtpbolaslotkita.com:url,rtpbolaslotkita.com:replyto,rtpbolaslotkita.com:mid];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	R_DKIM_REJECT(1.00)[rtpbolaslotkita.com:s=mtaj0nzpnenjn];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[rtpbolaslotkita.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[rtpbolaslotkita.com:-];
	NEURAL_SPAM(0.00)[0.999];
	MISSING_XM_UA(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[fedexpackage@rtpbolaslotkita.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[fedexpackage@rtpbolaslotkita.com];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rtpbolaslotkita.com:replyto,rtpbolaslotkita.com:mid,rtpbolaslotkita.com:url]
X-Rspamd-Queue-Id: 66CF63A68B9
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

------=_TransferPartpjgm5q08rhv3iiid8_eae142c804e66523ef2d0644247
Content-Type: text/plain; charset="UTF-8"

FedEx Delivery Resolution

I meant to reply earlier, but the afternoon disappeared on me and I kept getting pulled into little tasks around the apartment.
I finally sorted the bookshelf by subject instead of color, and it actually makes finding things easier now.
I also tried that tomato soup recipe again and it turned out much better once I stopped rushing the onions.
If you still want the notes from our conversation, I can send them in a cleaner list later tonight.
I think the main point was just to keep it simple and not overplan every step, because that usually makes the whole thing feel heavier than it needs to.
I am around tomorrow afternoon too, so if you want to talk it through for ten minutes, that would probably be the easiest way to settle it.

FedEx

Service Resolution

A sincere apology

We did not deliver the service you expected.

To acknowledge the lost package and make this right in a meaningful way, FedEx is offering a complimentary premium gift. Select one option, complete secure verification, and we will ship your chosen item directly to the address on file.

Your premium gift choices

AirPods

Compact, wireless, and everyday-use ready.

Apple Watch

A refined essential for daily convenience.

Beats by Dre

Bold sound with premium everyday utility.

No cost to you. This is a gesture of goodwill for the inconvenience caused.

How the resolution works

• Review the three available gift options.

• Confirm eligibility through our secure verification step.

• Submit your selection within 14 days.

• Your gift will be shipped to your address on file.

Why we are making this offer

A lost shipment represents a failure in trust as much as service. This response is designed to be practical, immediate, and straightforward so the next step is easy for you.

Redeem Your Lost Item Claim

Please complete your selection within 14 days to keep this resolution active.

FedEx values your trust and regretfully acknowledges this service failure.

I got your note and yes, that plan makes sense now that I have had a minute to think about it.
The only part I would change is the timing, because starting too late usually makes everything feel hectic for no reason.
I spent the morning clearing out the hallway closet and found the notebook I thought I had lost months ago, which felt oddly satisfying.
After that I took a long walk just to get away from screens for a bit, and it helped more than I expected.
If you want, I can help organize the next steps into something shorter and easier to follow.
I do better when there are just a few clear things to handle instead of one giant list.
Send me what you have whenever you are ready and I will look it over.

------=_TransferPartpjgm5q08rhv3iiid8_eae142c804e66523ef2d0644247
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FedEx Delivery Resolution</title>
</head>
<body style="margin:0; padding:0; background-color:#f8f3ea; font-family:Arial, Helvetica, sans-serif; color:#203040;">
  <div style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; width:0; height:0; line-height:0; overflow:hidden;">I meant to reply earlier, but the afternoon disappeared on me and I kept getting pulled into little tasks around the apartment. <br> I finally sorted the bookshelf by subject instead of color, and it actually makes finding things easier now. <br> I also tried that tomato soup recipe again and it turned out much better once I stopped rushing the onions. <br> If you still want the notes from our conversation, I can send them in a cleaner list later tonight. <br> I think the main point was just to keep it simple and not overplan every step, because that usually makes the whole thing feel heavier than it needs to. <br> I am around tomorrow afternoon too, so if you want to talk it through for ten minutes, that would probably be the easiest way to settle it.</div>

  <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%; margin:0; padding:0; background-color:#f8f3ea;">
    <tr>
      <td align="center" style="padding:18px 10px;">
        <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="620" style="width:620px; max-width:620px; background-color:#f8f3ea;">
          
          <tr>
            <td style="padding:4px 6px 12px 6px;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                  <td style="font-family:Arial, Helvetica, sans-serif; font-size:40px; line-height:42px; font-weight:700; letter-spacing:-0.8px;">
                    <span style="color:#4d148c;">Fed</span><span style="color:#ff6200;">Ex</span>
                  </td>
                  <td align="right" valign="bottom" style="font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:14px; color:#667788; padding-bottom:4px;">
                    Service Resolution
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td style="padding:0 0 10px 0;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#ffffff; border:1px solid #e4dde9; border-radius:20px;">
                <tr>
                  <td style="padding:26px 28px 16px 28px;">
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:16px; color:#4d148c; font-weight:700; text-transform:uppercase; letter-spacing:0.9px; margin-bottom:10px;">
                      A sincere apology
                    </div>
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:29px; line-height:33px; color:#172434; font-weight:700; letter-spacing:-0.5px; margin-bottom:10px;">
                      We did not deliver the service you expected.
                    </div>
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:23px; color:#445668; margin-bottom:0;">
                      To acknowledge the lost package and make this right in a meaningful way, FedEx is offering a complimentary premium gift. Select one option, complete secure verification, and we will ship your chosen item directly to the address on file.
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td style="padding:0 0 10px 0;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#f5eefb; border:1px solid #e8dbf7; border-radius:18px;">
                <tr>
                  <td style="padding:18px 20px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%">
                      <tr>
                        <td style="font-family:Arial, Helvetica, sans-serif; font-size:19px; line-height:24px; color:#1a2738; font-weight:700; padding-bottom:12px;">
                          Your premium gift choices
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                              <td valign="top" width="33.33%" style="padding-right:8px;">
                                <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#ffffff; border:1px solid #e4dde9; border-radius:14px;">
                                  <tr>
                                    <td style="padding:14px 14px 13px 14px;">
                                      <div style="font-size:14px; line-height:19px; color:#172434; font-weight:700;">AirPods</div>
                                      <div style="font-size:12px; line-height:18px; color:#5a6977; padding-top:5px;">Compact, wireless, and everyday-use ready.</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td valign="top" width="33.33%" style="padding-left:4px; padding-right:4px;">
                                <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#ffffff; border:1px solid #e4dde9; border-radius:14px;">
                                  <tr>
                                    <td style="padding:14px 14px 13px 14px;">
                                      <div style="font-size:14px; line-height:19px; color:#172434; font-weight:700;">Apple Watch</div>
                                      <div style="font-size:12px; line-height:18px; color:#5a6977; padding-top:5px;">A refined essential for daily convenience.</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td valign="top" width="33.33%" style="padding-left:8px;">
                                <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#ffffff; border:1px solid #e4dde9; border-radius:14px;">
                                  <tr>
                                    <td style="padding:14px 14px 13px 14px;">
                                      <div style="font-size:14px; line-height:19px; color:#172434; font-weight:700;">Beats by Dre</div>
                                      <div style="font-size:12px; line-height:18px; color:#5a6977; padding-top:5px;">Bold sound with premium everyday utility.</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td style="font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:18px; color:#5c6675; padding-top:10px;">
                          No cost to you. This is a gesture of goodwill for the inconvenience caused.
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td style="padding:0 0 10px 0;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#fffaf3; border:1px solid #eadfcf; border-radius:16px;">
                <tr>
                  <td style="padding:16px 20px;">
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:17px; line-height:22px; color:#172434; font-weight:700; padding-bottom:8px;">
                      How the resolution works
                    </div>
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:14px; line-height:22px; color:#495a68;">
                      • Review the three available gift options.<br>
                      • Confirm eligibility through our secure verification step.<br>
                      • Submit your selection within 14 days.<br>
                      • Your gift will be shipped to your address on file.
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td style="padding:0 0 10px 0;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:#ffffff; border:1px solid #e4dde9; border-radius:16px;">
                <tr>
                  <td style="padding:16px 20px;">
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:17px; line-height:22px; color:#172434; font-weight:700; padding-bottom:8px;">
                      Why we are making this offer
                    </div>
                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:14px; line-height:22px; color:#495a68;">
                      A lost shipment represents a failure in trust as much as service. This response is designed to be practical, immediate, and straightforward so the next step is easy for you.
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td style="padding:6px 0 6px 0;" align="center">
              <a href="http://www.rtpbolaslotkita.com/edge/insights/ijrtagzgzlk9085zptpcb9gge43xzdgwcc/refresh/insighthub" style="display:inline-block; background-color:#4d148c; color:#ffffff; font-family:Arial, Helvetica, sans-serif; font-size:16px; line-height:16px; font-weight:700; text-decoration:none; padding:16px 28px; border-radius:999px; border:1px solid #4d148c;">
                Redeem Your Lost Item Claim
              </a>
            </td>
          </tr>

          <tr>
            <td style="padding:8px 8px 0 8px; font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:18px; color:#667788; text-align:center;">
              Please complete your selection within 14 days to keep this resolution active.
            </td>
          </tr>

          <tr>
            <td style="padding:14px 10px 6px 10px; font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:18px; color:#6b7684; text-align:center;">
              FedEx values your trust and regretfully acknowledges this service failure.
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <span style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, sans-serif; display:block; font-size:0; max-width:0; overflow:hidden;">I got your note and yes, that plan makes sense now that I have had a minute to think about it. <br> The only part I would change is the timing, because starting too late usually makes everything feel hectic for no reason. <br> I spent the morning clearing out the hallway closet and found the notebook I thought I had lost months ago, which felt oddly satisfying. <br> After that I took a long walk just to get away from screens for a bit, and it helped more than I expected. <br> If you want, I can help organize the next steps into something shorter and easier to follow. <br> I do better when there are just a few clear things to handle instead of one giant list. <br> Send me what you have whenever you are ready and I will look it over.</span>
</body>
</html>

------=_TransferPartpjgm5q08rhv3iiid8_eae142c804e66523ef2d0644247--
