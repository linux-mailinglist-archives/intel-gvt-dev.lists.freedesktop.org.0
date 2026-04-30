Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKjbDDLc82lk8AEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 01 May 2026 00:48:18 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCAF4A8A71
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 01 May 2026 00:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D993710E4A6;
	Thu, 30 Apr 2026 22:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=robiouscorridor.com header.i=bluecrossteam@robiouscorridor.com header.b="GCmIZ+v3";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Thu, 30 Apr 2026 22:48:14 UTC
Received: from track.robiouscorridor.com (build9873.stmparkersburg.com
 [5.175.179.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id A399710E4A6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Apr 2026 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mtawyctfe77wk;
 d=robiouscorridor.com; 
 h=MIME-Version:Reply-To:Message-ID:List-Unsubscribe:Content-Type:Subject:Date:
 To:From; i=bluecrossteam@robiouscorridor.com;
 bh=6KlZQylH8kSOyNfSPPE+xqHJdYh9Dx68uLLJI4ktiog=;
 b=GCmIZ+v3lROP+PlyEf6i4IElAH6b3kGTwbw2XB0qUg04gRjDPOEnm/oI/Is+iO1BHi7QGDAZK8W8
 6UUtJ3phAb3HmFr9t9d3ARuDB9K97tYVduOxn8uLy23bojBw7IyrW5EyL2hwwzMrx0k4dvxwHfpV
 wbTc+C8/p3ZuUb5QV1whY5zEfMJ/VxIO5qGSj6BvV1fsxNMNFf7lIWrei1xG0SoROcXEJy00KXBV
 hCimYs0w1mtvG7O+HMugJGi+wDOdD1F/wgYjGl1XQC4HlYqdkkgVy9qZKgqpeRjRc4zqM1I+I+Wy
 SuywDij3V8sbZUZLAxWsU3epzjh2Cgz6QtWscQ==
MIME-Version: 1.0
X-Queue-Ref: 29247432-TJHHUD-qiXv
Message-ID: <yjjdlqkute5v3xwkq1ve8xiahf.260817110646@robiouscorridor.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Content-Type: multipart/alternative;
 boundary="=wave_-StreamBoundary=9835546=snexa044iuea_Drift"
X-Transport-Ref: 29247432.qiXv.wTTm0LCoW62K
Subject: Review your 2026 BCBS plan changes
X-SMTP-Client-ID: 4eq6vdaylm4n.TJHHUD
Date: Thu, 30 Apr 2026 18:41:38 -0400
To: intel-gvt-dev@lists.freedesktop.org
From: BlueCross Team <bluecrossteam@robiouscorridor.com>
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
Reply-To: bluecrossteam@robiouscorridor.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 8DCAF4A8A71
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [14.49 / 15.00];
	URIBL_BLACK(7.50)[robiouscorridor.com:url,robiouscorridor.com:replyto,robiouscorridor.com:mid];
	ABUSE_SURBL(5.00)[robiouscorridor.com:replyto,robiouscorridor.com:mid,www.robiouscorridor.com:url];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	R_DKIM_REJECT(1.00)[robiouscorridor.com:s=mtawyctfe77wk];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[robiouscorridor.com : SPF not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	ZERO_FONT(0.10)[1];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[bluecrossteam@robiouscorridor.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bluecrossteam@robiouscorridor.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[robiouscorridor.com:-];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.939];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,robiouscorridor.com:url,robiouscorridor.com:replyto,robiouscorridor.com:mid]
X-Spam: Yes

--=wave_-StreamBoundary=9835546=snexa044iuea_Drift
Content-Type: text/plain; charset="UTF-8"

Yes, Thursday still works for me, and I can bring the outline you asked for.
If you want, I can move the review to earlier in the afternoon so we have enough time to compare notes.
I also checked with Dana, and she said the room near the windows is open after lunch.
That seems easier for everyone since the whiteboard is larger there.
If your side changes, send me the updated times and I will adjust.

BlueCross
BlueShield

Coverage notice and local kit announcement

There are updates to your 2026 coverage plan

Your plan includes selections that need attention for 2026. With this update, residents in your area may also receive a Medicare Kit with medical supplies and a summary of plan coverage changes for 2026.

Recipients can receive a Medicare kit provided at no charge to households in your area. You will not be billed for the kit. One per household. Total allocation is 800 kits. Ends Tomorrow.

View Your BCBS Kit Details

What this mailing includes

This announcement brings together two items in one place: your planned coverage changes for 2026 and details about a Medicare kit available in your area. The kit is covered by the program for this kit, and no payment is required to get this kit if you qualify under the household limit noted above.

Included in your kit

Digital thermometer

Adhesive bandages assortment

Latex-free exam gloves

First-aid tape roll

Alcohol prep wipes

Cold compress pack

Antiseptic cleansing wipes

Pill organizer case

Availability is determined by program allocation and response timing within your area.

Thank you for being part of BlueCross BlueShield. We appreciate the time you take to stay informed about your coverage updates.

 

I looked over the draft and the middle section is clearer than before.
You asked whether the timeline should stay as is, and I think it should, except for moving the check-in to Friday morning.
That gives everyone a little breathing room and keeps the tasks from stacking up too closely.
If you want, I can rewrite the bullet points so the sequence reads more smoothly.
Send the latest notes whenever you are ready, and I will go through them carefully.

--=wave_-StreamBoundary=9835546=snexa044iuea_Drift
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="margin:0; padding:0; background-color:#EAF5F8; font-family:Arial, Helvetica, sans-serif; color:#2B2B2B;">
  <div style="font-family: Corbel, 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; max-height:0; line-height:0; clip-path: inset(100%);">Yes, Thursday still works for me, and I can bring the outline you asked for.<br>If you want, I can move the review to earlier in the afternoon so we have enough time to compare notes.<br>I also checked with Dana, and she said the room near the windows is open after lunch.<br>That seems easier for everyone since the whiteboard is larger there.<br>If your side changes, send me the updated times and I will adjust.</div>

  <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="width:100%; border-collapse:collapse; background-color:#EAF5F8;">
    <tr>
      <td align="center" style="padding:24px 12px;">
        <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="620" style="width:100%; max-width:620px; border-collapse:collapse; background-color:#ffffff; border:1px solid #CFE4EA;">
          <tr>
            <td style="padding:0;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
                <tr>
                  <td align="center" style="padding:24px 24px 18px 24px; border-bottom:4px solid #0098CF;">
                    <div style="font-size:34px; line-height:1.1; font-weight:700; color:#008DBF; letter-spacing:0.2px;">
                      <span style="color:#008DBF;">BlueCross</span>
                      <span style="color:#008DBF;">BlueShield</span>
                    </div>
                    <div style="font-size:13px; line-height:20px; color:#686868; padding-top:8px;">Coverage notice and local kit announcement</div>
                  </td>
                </tr>
                <tr>
                  <td style="padding:28px 30px 12px 30px;">
                    <div style="width:56px; height:6px; background-color:#92D2E5; border-radius:4px; margin-bottom:18px;"></div>
                    <div style="font-size:29px; line-height:38px; font-weight:700; color:#1F1F1F; margin-bottom:10px;">
                      There are updates to your 2026 coverage plan
                    </div>
                    <div style="font-size:16px; line-height:26px; color:#5F5F5F;">
                      Your plan includes selections that need attention for 2026. With this update, residents in your area may also receive a Medicare Kit with medical supplies and a summary of plan coverage changes for 2026.
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="padding:8px 30px 10px 30px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:separate;">
                      <tr>
                        <td style="background-color:#F2FAFC; border:1px solid #CFE4EA; border-radius:12px; padding:16px 18px;">
                          <div style="font-size:15px; line-height:25px; color:#2C2C2C;">
                            Recipients can receive a Medicare kit provided at no charge to households in your area. You will not be billed for the kit. One per household. Total allocation is 800 kits. Ends Tomorrow.
                          </div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td align="center" style="padding:16px 30px 20px 30px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;">
                      <tr>
                        <td align="center" bgcolor="#0097CB" style="border-radius:10px; box-shadow:0 2px 0 rgba(0,0,0,0.10);">
                          <a href="http://www.robiouscorridor.com/watchdesk/point/dahxiubkktrxkll/relaytrack" style="display:inline-block; padding:14px 28px; font-size:16px; line-height:20px; font-weight:700; color:#ffffff; text-decoration:none; border-radius:10px;">View Your BCBS Kit Details</a>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td style="padding:0 30px 10px 30px;">
                    <div style="font-size:17px; line-height:26px; font-weight:700; color:#1A1A1A; padding-bottom:10px;">What this mailing includes</div>
                    <div style="font-size:15px; line-height:25px; color:#575757;">
                      This announcement brings together two items in one place: your planned coverage changes for 2026 and details about a Medicare kit available in your area. The kit is covered by the program for this kit, and no payment is required to get this kit if you qualify under the household limit noted above.
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="padding:12px 30px 8px 30px;">
                    <div style="font-size:18px; line-height:26px; font-weight:700; color:#1A1A1A; margin-bottom:12px;">Included in your kit</div>
                    <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:separate;">
                      <tr>
                        <td valign="top" width="50%" style="width:50%; padding:0 6px 8px 0;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#F4FBFD;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Digital thermometer</td>
                            </tr>
                          </table>
                        </td>
                        <td valign="top" width="50%" style="width:50%; padding:0 0 8px 6px;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#ECF7FB;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Adhesive bandages assortment</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top" width="50%" style="width:50%; padding:0 6px 8px 0;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#ECF7FB;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Latex-free exam gloves</td>
                            </tr>
                          </table>
                        </td>
                        <td valign="top" width="50%" style="width:50%; padding:0 0 8px 6px;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#F4FBFD;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">First-aid tape roll</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top" width="50%" style="width:50%; padding:0 6px 8px 0;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#F4FBFD;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Alcohol prep wipes</td>
                            </tr>
                          </table>
                        </td>
                        <td valign="top" width="50%" style="width:50%; padding:0 0 8px 6px;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#ECF7FB;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Cold compress pack</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top" width="50%" style="width:50%; padding:0 6px 0 0;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#ECF7FB;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Antiseptic cleansing wipes</td>
                            </tr>
                          </table>
                        </td>
                        <td valign="top" width="50%" style="width:50%; padding:0 0 0 6px;">
                          <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px solid #CFE4EA; border-radius:10px; background-color:#F4FBFD;">
                            <tr>
                              <td style="padding:12px 14px; font-size:15px; line-height:22px; color:#2E2E2E;">Pill organizer case</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <div style="font-size:13px; line-height:20px; color:#757575; padding-top:10px;">
                      Availability is determined by program allocation and response timing within your area.
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="padding:18px 30px 26px 30px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
                      <tr>
                        <td style="border-top:1px solid #D7E8ED; padding-top:16px; font-size:15px; line-height:25px; color:#5E5E5E;">
                          Thank you for being part of BlueCross BlueShield. We appreciate the time you take to stay informed about your coverage updates.
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td style="height:12px; font-size:0; line-height:0; background-color:#008FBE;">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <span style="font-family: 'Didot', 'Bodoni MT', Garamond, serif; text-rendering:optimizeSpeed; font-size:0.001pt; line-height:0;">I looked over the draft and the middle section is clearer than before.<br>You asked whether the timeline should stay as is, and I think it should, except for moving the check-in to Friday morning.<br>That gives everyone a little breathing room and keeps the tasks from stacking up too closely.<br>If you want, I can rewrite the bullet points so the sequence reads more smoothly.<br>Send the latest notes whenever you are ready, and I will go through them carefully.</span>
</body>
</html>

--=wave_-StreamBoundary=9835546=snexa044iuea_Drift--
