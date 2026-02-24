Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LzwqMpsMnmkfTQQAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Feb 2026 21:39:55 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5318C712
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Feb 2026 21:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357B910E32E;
	Tue, 24 Feb 2026 20:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=novamotive.uk header.i=harryanddavi@novamotive.uk header.b="f4F/zpc8";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Tue, 24 Feb 2026 20:39:51 UTC
Received: from mail.novamotive.uk (whistle.Skybrixes.com [23.90.39.44])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B09B10E32E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Feb 2026 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=v2602; d=novamotive.uk;
 h=Date:From:Reply-To:To:Subject:Message-ID:MIME-Version:Content-Type;
 i=harryanddavi@novamotive.uk;
 bh=Q84dlGa7axkURTTCpBUjRHfPDT6lTVM1Am+TNqep328=;
 b=f4F/zpc8wAS54wpv2cVA58wR9HoEW3qEIbg86sPGVGOLfB/91KdKZ7KoV5ac0V3yw9ODqwMza/15
 FA4NPq65BxD/aVlH67ISrtZIGkHT44mWsHBCupON9uJ1kCV3EGvuBQVmcbiCumPEh1X3ncfujqCg
 zwdBYQGiGawg0ikIsAWUJ7iz7sk+peStl88pJZsNWdpewKMLK9JC3YbEcRo3fefZn88gRptJOqcM
 4KuL8BWShFrZcU0rsrmqgsuvEmwFj09sgFm1mSEIJptej/chW244+eEPZQoH4Oqze87D8i4ILa/Y
 PPyE1PiEEN+65+Tvzj+lZfxvFYI+k/Ld+vGL7g==
Date: Tue, 24 Feb 2026 15:34:45 -0500
From: Harry and David <harryanddavi@novamotive.uk>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Status update on your gift basket
Message-ID: <jaKWNMJX.2c@hr0b.novamotive.uk>
X-Request-ID: 67002c2b-75aa-400b-9529-5a24e08f64c7
Feedback-ID: cqyh0:novamotive.uk:mail
X-UUID: f1f2ff52a9f19
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part.qq55kp.482217-wSoJc8ReQ6uAQxf9bjwNrAYt-M43"
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
Reply-To: harryanddavi@novamotive.uk
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [14.29 / 15.00];
	URIBL_BLACK(7.50)[novamotive.uk:dkim,novamotive.uk:url,novamotive.uk:replyto];
	ABUSE_SURBL(5.00)[novamotive.uk:replyto,novamotive.uk:dkim,www.novamotive.uk:url,hr0b.novamotive.uk:mid];
	R_BAD_CTE_7BIT(1.05)[7bit,utf8];
	URI_COUNT_ODD(1.00)[1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[novamotive.uk:s=v2602];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_SPAM(0.00)[hr0b.novamotive.uk:mid];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_POLICY_ALLOW(0.00)[novamotive.uk,quarantine];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[harryanddavi@novamotive.uk];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harryanddavi@novamotive.uk,intel-gvt-dev-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[novamotive.uk:+];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	NEURAL_SPAM(0.00)[1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[novamotive.uk:dkim,novamotive.uk:url,novamotive.uk:replyto]
X-Rspamd-Queue-Id: 7CB5318C712
X-Rspamd-Action: add header
X-Spam: Yes

------=_Part.qq55kp.482217-wSoJc8ReQ6uAQxf9bjwNrAYt-M43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Harry &amp; David Reserved Gift Basket
    Your reserved Harry &amp; David gourmet basket is standing by for shipment until remaining units are taken.
                    Reserved Appreciation Basket
                    Ends Tonight
                HARRY &amp; DAVID
                GOURMET SELECTIONS • SENT WITH CARE
                Your Reserved Gourmet Basket
                Ready To Ship
                You’re receiving this note because we’ve held a Harry &amp; David gourmet basket in your name. It’s packed with a curated mix of sweet and savory items and prepared for quick shipment. All that’s left is a brief confirmation so we know where to send it before remaining units are assigned to other recipients.
                      Time-sensitive: remaining baskets are being claimed quickly.
                      Still available: 30 baskets
                          &nbsp;
                          &nbsp;
                  This indicator reflects live reservations. Once inventory is fully spoken for, this held basket will be reassigned and the link below will no longer confirm a shipment for you.
                    What’s inside your basket
                      Each reserved basket includes a balanced selection of pantry-ready bites, ideal for quiet evenings at home or sharing with guests. Items may vary slightly by availability, but the experience is designed to feel generous and considered.
                    Why this is being held
                      This basket is set aside as a gesture of appreciation for staying engaged with Harry &amp; David. Instead of offering a generic discount, we chose to assemble a tangible experience you can actually enjoy. To keep things fair, each invitation is tied to a limited pool of baskets.
                How this reserved gift works
                      Step 1
                      Confirm details
                        Use the button below to answer a short sequence of questions so we can confirm your preferred destination and basic delivery preferences before remaining baskets are exhausted.
                      Step 2
                      Reservation locked
                        Once your responses are submitted, your held basket is secured. You’ll see an on-screen confirmation summarizing what to expect next along with a reference for your reservation.
                      Step 3
                      Prepared for shipment
                        Our team prepares your Harry &amp; David selection using the freshest available items in your reserved tier and readies it for packing and prompt dispatch to the destination you confirm.
              &nbsp;
                        Confirm My Reserved Basket
                      Confirm My Reserved Basket
                This message was sent to share a reserved Harry &amp; David gourmet basket opportunity with you. When the remaining baskets shown above are claimed, this held spot is released and future confirmations will no longer secure shipment from this specific allotment.
        &nbsp;
            If you do not want to continue getting these, remove yourself
            here.
        &nbsp;
            Harry &amp; David has spent decades refining how gourmet food is selected, paired, and delivered so that opening a package feels like an occasion, not just another box on the doorstep. The baskets referenced in this note are assembled from a rotating range of pantry items, confections, and savories that are chosen to travel well and arrive in a state fit for sharing. By organizing gifts into focused assortments, our team can keep an eye on balance across flavor, texture, and presentation, while still leaving room for seasonal adjustments and regional availability. When you respond to an invitation like this, you help us understand the types of experiences that are valued most, which in turn guides future assortments and formats. That ongoing feedback loop is how classic pairings stay relevant, how new ideas are tested, and how we continue to refine the way a Harry &amp; David delivery feels from the moment it’s expected to the moment it’s enjoyed.

http://www.novamotive.uk/primped

------=_Part.qq55kp.482217-wSoJc8ReQ6uAQxf9bjwNrAYt-M43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Harry &amp; David Reserved Gift Basket</title>
  <style type="text/css">
    body,html{margin:0;padding:0;width:100%;height:100%;background:#f6f1e6;}
    body{font-family:Arial,Helvetica,sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
    table{border-spacing:0;border-collapse:collapse;mso-table-lspace:0;mso-table-rspace:0;}
    img{border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;}
    a{text-decoration:none;color:#d73833;}
    .w-wrap{width:100%;background:#f6f1e6;}
    .w-shell{max-width:640px;margin:0 auto;background:#ffffff;}
    .w-pad-main{padding:24px 32px;}
    .w-logo-bar{background:#ffffff;border-bottom:1px solid #eadfcd;}
    .w-logo-text{font-size:26px;letter-spacing:2px;font-weight:bold;color:#d73833;text-transform:uppercase;}
    .w-logo-sub{font-size:12px;color:#7b6a5a;letter-spacing:1px;text-transform:uppercase;margin-top:4px;}
    .w-banner{background:#3b2a1e;color:#f6f1e6;padding:10px 18px;font-size:12px;}
    .w-banner span{font-weight:bold;color:#e3123d;}
    .w-hero{padding:22px 32px 10px 32px;}
    .w-hero-title{font-size:30px;line-height:1.25;color:#2b1e16;font-weight:bold;}
    .w-hero-accent{color:#e3123d;}
    .w-hero-copy{font-size:15px;line-height:1.7;color:#3d342e;margin-top:10px;}
    .w-urgency-wrap{padding:0 32px 6px 32px;}
    .w-urgency-box{background:#fbf7ef;border:1px solid #eadfcd;border-radius:14px;padding:14px 16px;}
    .w-urg-row{font-size:13px;line-height:1.6;color:#3d342e;}
    .w-urg-left{font-weight:bold;color:#e3123d;}
    .w-urg-right{text-align:right;}
    .w-bar-shell{margin-top:10px;}
    .w-bar-outer{width:100%;background:#eadfcd;border-radius:999px;}
    .w-bar-inner{background:#d73833;height:10px;border-radius:999px;width:22%;}
    .w-bar-note{font-size:11px;line-height:1.6;color:#6b5a4c;margin-top:8px;}
    .w-zigzag{padding:10px 32px 4px 32px;}
    .w-z-row{width:100%;}
    .w-z-cell{vertical-align:top;padding:12px 0;}
    .w-z-title{font-size:17px;font-weight:bold;color:#2b1e16;margin-bottom:6px;}
    .w-z-copy{font-size:14px;line-height:1.7;color:#3d342e;}
    .w-card-grid{padding:4px 32px 18px 32px;}
    .w-card-shell{border:1px solid #efe4d6;border-radius:14px;padding:14px 16px;}
    .w-card-head{font-size:16px;font-weight:bold;color:#2b1e16;margin-bottom:6px;}
    .w-card-row{width:100%;}
    .w-card-col{vertical-align:top;padding-top:8px;}
    .w-card-tag{font-size:11px;font-weight:bold;color:#e3123d;letter-spacing:0.5px;text-transform:uppercase;margin-bottom:4px;}
    .w-card-title{font-size:14px;font-weight:bold;color:#2b1e16;margin-bottom:4px;}
    .w-card-text{font-size:13px;line-height:1.7;color:#3d342e;}
    .w-cta-wrap{padding:4px 32px 22px 32px;text-align:center;}
    .w-cta-spacer{height:4px;line-height:4px;font-size:4px;}
    .w-footer-main{background:#3b2a1e;padding:14px 24px;}
    .w-foot-copy{font-size:11px;line-height:1.7;color:#f6f1e6;text-align:left;}
    .w-gap-lg{height:28px;line-height:28px;font-size:28px;}
    .w-unsub-wrap{max-width:640px;margin:0 auto;padding:0 24px 10px 24px;text-align:center;}
    .w-unsub-text{font-size:12px;line-height:1.7;color:#6b5a4c;}
    .w-unsub-text a{color:#d73833;text-decoration:underline;}
    .w-gap-sm{height:18px;line-height:18px;font-size:18px;}
    .w-info-wrap{max-width:640px;margin:0 auto;padding:0 24px 40px 24px;}
    .w-info-text{font-size:12px;line-height:1.7;color:#6b5a4c;text-align:left;}
    @media only screen and (max-width:640px){
      .w-shell{width:100%!important;border-radius:0!important;}
      .w-pad-main,.w-hero,.w-urgency-wrap,.w-zigzag,.w-card-grid,.w-cta-wrap{padding-left:18px!important;padding-right:18px!important;}
    }
    @media only screen and (max-width:520px){
      .w-hero-title{font-size:24px!important;}
      .w-hero-copy{font-size:14px!important;}
      .w-urg-row{display:block;text-align:left!important;}
      .w-urg-right{padding-top:4px;text-align:left!important;}
      .w-card-row,.w-z-row{display:block;}
      .w-card-col,.w-z-cell{display:block;width:100%!important;}
    }
  </style>
</head>
<body>
  <div style="display:none;font-size:1px;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden;">
    Your reserved Harry &amp; David gourmet basket is standing by for shipment until remaining units are taken.
  </div>

  <table role="presentation" class="w-wrap" width="100%">
    <tr>
      <td align="center">

        <table role="presentation" class="w-shell" width="640">
          <tr>
            <td class="w-banner">
              <table role="presentation" width="100%">
                <tr>
                  <td align="left">
                    Reserved Appreciation Basket
                  </td>
                  <td align="right">
                    Ends <span>Tonight</span>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="w-pad-main w-logo-bar">
              <div class="w-logo-text">
                HARRY &amp; DAVID
              </div>
              <div class="w-logo-sub">
                GOURMET SELECTIONS • SENT WITH CARE
              </div>
            </td>
          </tr>

          <tr>
            <td class="w-hero">
              <div class="w-hero-title">
                Your Reserved Gourmet Basket<br>
                <span class="w-hero-accent">Ready To Ship</span>
              </div>
              <div class="w-hero-copy">
                You’re receiving this note because we’ve held a Harry &amp; David gourmet basket in your name. It’s packed with a curated mix of sweet and savory items and prepared for quick shipment. All that’s left is a brief confirmation so we know where to send it before remaining units are assigned to other recipients.
              </div>
            </td>
          </tr>

          <tr>
            <td class="w-urgency-wrap">
              <div class="w-urgency-box">
                <table role="presentation" width="100%">
                  <tr>
                    <td class="w-urg-row w-urg-left">
                      Time-sensitive: remaining baskets are being claimed quickly.
                    </td>
                    <td class="w-urg-row w-urg-right">
                      Still available: <strong>30 baskets</strong>
                    </td>
                  </tr>
                </table>

                <table role="presentation" width="100%" class="w-bar-shell">
                  <tr>
                    <td class="w-bar-outer">
                      <table role="presentation" width="100%">
                        <tr>
                          <td class="w-bar-inner">&nbsp;</td>
                          <td style="height:10px;line-height:10px;font-size:1px;">&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>

                <div class="w-bar-note">
                  This indicator reflects live reservations. Once inventory is fully spoken for, this held basket will be reassigned and the link below will no longer confirm a shipment for you.
                </div>
              </div>
            </td>
          </tr>

          <tr>
            <td class="w-zigzag">
              <table role="presentation" class="w-z-row">
                <tr>
                  <td class="w-z-cell" width="50%">
                    <div class="w-z-title">What’s inside your basket</div>
                    <div class="w-z-copy">
                      Each reserved basket includes a balanced selection of pantry-ready bites, ideal for quiet evenings at home or sharing with guests. Items may vary slightly by availability, but the experience is designed to feel generous and considered.
                    </div>
                  </td>
                  <td class="w-z-cell" width="50%">
                    <div class="w-z-title">Why this is being held</div>
                    <div class="w-z-copy">
                      This basket is set aside as a gesture of appreciation for staying engaged with Harry &amp; David. Instead of offering a generic discount, we chose to assemble a tangible experience you can actually enjoy. To keep things fair, each invitation is tied to a limited pool of baskets.
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="w-card-grid">
              <div class="w-card-shell">
                <div class="w-card-head">How this reserved gift works</div>
                <table role="presentation" class="w-card-row">
                  <tr>
                    <td class="w-card-col" width="33%">
                      <div class="w-card-tag">Step 1</div>
                      <div class="w-card-title">Confirm details</div>
                      <div class="w-card-text">
                        Use the button below to answer a short sequence of questions so we can confirm your preferred destination and basic delivery preferences before remaining baskets are exhausted.
                      </div>
                    </td>
                    <td class="w-card-col" width="33%">
                      <div class="w-card-tag">Step 2</div>
                      <div class="w-card-title">Reservation locked</div>
                      <div class="w-card-text">
                        Once your responses are submitted, your held basket is secured. You’ll see an on-screen confirmation summarizing what to expect next along with a reference for your reservation.
                      </div>
                    </td>
                    <td class="w-card-col" width="33%">
                      <div class="w-card-tag">Step 3</div>
                      <div class="w-card-title">Prepared for shipment</div>
                      <div class="w-card-text">
                        Our team prepares your Harry &amp; David selection using the freshest available items in your reserved tier and readies it for packing and prompt dispatch to the destination you confirm.
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>

          <tr>
            <td class="w-cta-wrap">
              <div class="w-cta-spacer">&nbsp;</div>
              <!-- Button: bottom-centered placement -->
              <!--[if mso]>
              <table role="presentation" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center">
                    <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" href="http://www.novamotive.uk/primped" style="height:48px;v-text-anchor:middle;width:420px;" arcsize="12%" strokecolor="#d73833" fillcolor="#d73833">
                      <w:anchorlock/>
                      <center style="color:#ffffff;font-family:Arial,Helvetica,sans-serif;font-size:16px;font-weight:bold;">
                        Confirm My Reserved Basket
                      </center>
                    </v:roundrect>
                  </td>
                </tr>
              </table>
              <!-->
              <!--[if !mso]><!-- -->
              <table role="presentation" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" style="border-radius:12px;background:#d73833;">
                    <a href="http://www.novamotive.uk/primped" style="display:inline-block;padding:14px 40px;border-radius:12px;border:1px solid #d73833;background:#d73833;color:#ffffff;font-size:16px;font-weight:bold;line-height:1.2;text-align:center;">
                      Confirm My Reserved Basket
                    </a>
                  </td>
                </tr>
              </table>
              <!--<!-->
            </td>
          </tr>

          <tr>
            <td class="w-footer-main">
              <div class="w-foot-copy">
                This message was sent to share a reserved Harry &amp; David gourmet basket opportunity with you. When the remaining baskets shown above are claimed, this held spot is released and future confirmations will no longer secure shipment from this specific allotment.
              </div>
            </td>
          </tr>
        </table>

        <div class="w-gap-lg">&nbsp;</div>

        <div class="w-unsub-wrap">
          <div class="w-unsub-text">
            If you do not want to continue getting these, remove yourself
            <a href="http://www.novamotive.uk/primped">here</a>.
          </div>
        </div>

        <div class="w-gap-sm">&nbsp;</div>

        <div class="w-info-wrap">
          <div class="w-info-text">
            Harry &amp; David has spent decades refining how gourmet food is selected, paired, and delivered so that opening a package feels like an occasion, not just another box on the doorstep. The baskets referenced in this note are assembled from a rotating range of pantry items, confections, and savories that are chosen to travel well and arrive in a state fit for sharing. By organizing gifts into focused assortments, our team can keep an eye on balance across flavor, texture, and presentation, while still leaving room for seasonal adjustments and regional availability. When you respond to an invitation like this, you help us understand the types of experiences that are valued most, which in turn guides future assortments and formats. That ongoing feedback loop is how classic pairings stay relevant, how new ideas are tested, and how we continue to refine the way a Harry &amp; David delivery feels from the moment it’s expected to the moment it’s enjoyed.
          </div>
        </div>

      </td>
    </tr>
  </table>
  <img src="http://www.novamotive.uk/open/aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc.png" width="1" height="1" style="display:none" alt="">
</body>
</html>

------=_Part.qq55kp.482217-wSoJc8ReQ6uAQxf9bjwNrAYt-M43--
