Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJxBCr0ihWnM8wMAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Feb 2026 00:07:41 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6CF844B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Feb 2026 00:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1430E10E14F;
	Thu,  5 Feb 2026 23:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotstonewo.pro header.i=costcomember19@hotstonewo.pro header.b="samYxist";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Thu, 05 Feb 2026 23:07:37 UTC
Received: from mail.hotstonewo.pro (tundra.brightbranchyu.com [170.130.89.174])
 by gabe.freedesktop.org (Postfix) with ESMTP id A47E210E14F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Feb 2026 23:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=k1; d=hotstonewo.pro; 
 h=From:Reply-To:To:Subject:Date:Message-ID:MIME-Version:Content-Type; 
 i=costcomember19@hotstonewo.pro;
 bh=l7cDqU4cUoPjTXjDpZdDh/zD1i+ODUV/keHeVFlTz+Q=;
 b=samYxistrjfySolpH/rvpLf3JfVw7eLwpHOZW1w0E1j9IQTmoyhEKG1L+d3V6vpXYUQPbqNPnXFO
 imWlen3xSLYEO4ENwdsvL+dm1csyKlGJgMaS052r0btf6gRtMqo8/3r0a4eGcgJ9UMLaO54NYJG6
 Vs3m113rABznHeFbidTyDHB/c7t6UqY8FkYMUriCiI+9TUcQJ5HjN4kWdJ0dDtyd5AgPqO1sTGUr
 cpXYeWOOCy137F5qDWXFdH3U648lXgbYuN/v7OkwxRmHLGUzpfH6siHPP504Cq/F6/JAKKIGh9qT
 KZ8msIgC6Zzf3jkeHoNhmuDlM18Zzd3UmK9PRA==
From: Costco Membership Team <costcomember19@hotstonewo.pro>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Your Costco Visit: A Thank-You Awaits
Date: Thu, 5 Feb 2026 18:02:31 -0500
Message-ID: <Yk4zqmr9.VLG9CLmDffGPWCMM-d874d@mail.hotstonewo.pro>
X-Request-ID: a1e2a1fa-3159-4811-b539-4e3090d35a4b
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part.h6ejq5o.1d55-Cp59Wsaei9vrHQrTz5svKrYG-__ijl"
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
Reply-To: costcomember19@hotstonewo.pro
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [14.29 / 15.00];
	URIBL_BLACK(7.50)[hotstonewo.pro:replyto,hotstonewo.pro:url,hotstonewo.pro:dkim];
	ABUSE_SURBL(5.00)[hotstonewo.pro:replyto,hotstonewo.pro:dkim,www.hotstonewo.pro:url,mail.hotstonewo.pro:mid];
	R_BAD_CTE_7BIT(1.05)[7bit,utf8];
	URI_COUNT_ODD(1.00)[1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[hotstonewo.pro,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	R_DKIM_ALLOW(0.00)[hotstonewo.pro:s=k1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[hotstonewo.pro:+];
	NEURAL_SPAM(0.00)[0.263];
	MISSING_XM_UA(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[costcomember19@hotstonewo.pro,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	HAS_REPLYTO(0.00)[costcomember19@hotstonewo.pro]
X-Rspamd-Queue-Id: 71D6CF844B
X-Rspamd-Action: add header
X-Spam: Yes

------=_Part.h6ejq5o.1d55-Cp59Wsaei9vrHQrTz5svKrYG-__ijl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Costco Exclusive Offer
                COSTCO
                            Gold Star Executive
                            An Exclusive Offer For Our Valued Members
                            Dear Valued Costco Member,
                            On behalf of everyone at Costco Wholesale, thank you for choosing us as your trusted provider for quality and value. We trust your recent visits provided the exceptional savings and reliability that defines the Costco experience.
                            Bring the Professional Kitchen Experience Home
                                As a token of our appreciation for your loyalty, we're pleased to extend an exclusive invitation to receive a complimentary set of our Signature Professional Cookware.
                        Get Your Cookware Set
                        COSTCOPAN26
                            CLAIM YOUR COMPLIMENTARY SET
                            COSTCO SIGNATURE KITCHEN COLLECTION
                            The exact culinary tools engineered for durability and performance in the modern household.
                                    Premium Non-Stick Surface
                                    Designed for daily, heavy-duty use
                                    Optimal Heat Distribution
                                    Engineered for consistent cooking results
                                    Breathable Food-Safe Materials
                                    Temperature-regulating for even searing
                                    Professional-Grade Quality
                                    Identical to cookware used in professional kitchens
                        LIMITED COMPLIMENTARY INVENTORY
                        Only 450 cookware sets remain available for distribution.
                        THE COSTCO DIFFERENCE
                            For over four decades, Costco has set the standard for wholesale excellence. Our commitment to your satisfaction extends beyond our warehouse walls—it's forged into the quality of our products, reflected in every detail of our member services, and present in every thoughtful value we provide.
                            This cookware offer reflects our enduring promise: to provide consistent, exceptional quality wherever you are. We're not just offering kitchen tools; we're extending the Costco experience into your home.
                    COSTCO
                    WHOLESALE
                This offer is exclusively for Costco members. Please use the provided offer code at checkout.
                &copy; 2024 Costco Wholesale. All rights reserved.

http://www.hotstonewo.pro/ail013

------=_Part.h6ejq5o.1d55-Cp59Wsaei9vrHQrTz5svKrYG-__ijl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Costco Exclusive Offer</title>
    <style>
        /* CSS Reset - Fresh Approach */
        .costco-email * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        .costco-body {
            font-family: Arial, Helvetica, sans-serif;
            line-height: 1.4;
            color: #333333;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px 0;
        }
        
        /* Container System */
        .costco-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
        }
        
        /* Header Section */
        .costco-header {
            background-color: #005daa;
            padding: 25px 20px;
            text-align: center;
        }
        
        .costco-logo {
            font-family: Arial, sans-serif;
            font-size: 36px;
            font-weight: bold;
            color: #ffffff;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        
        .costco-logo span {
            color: #e3123d;
        }
        
        /* Zigzag Layout Implementation */
        .costco-zigzag {
            padding: 30px 20px;
        }
        
        .costco-zigzag-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 30px;
            align-items: center;
        }
        
        .costco-zigzag-reverse {
            flex-direction: row-reverse;
        }
        
        .costco-zigzag-content {
            flex: 1;
            min-width: 250px;
            padding: 20px;
        }
        
        .costco-zigzag-visual {
            flex: 1;
            min-width: 250px;
            padding: 20px;
            background-color: #f0f7ff;
            border-radius: 8px;
        }
        
        /* Typography */
        .costco-headline-main {
            color: #005daa;
            font-size: 28px;
            margin-bottom: 15px;
            line-height: 1.2;
        }
        
        .costco-headline-secondary {
            color: #e3123d;
            font-size: 22px;
            margin-bottom: 20px;
        }
        
        .costco-text {
            font-size: 16px;
            margin-bottom: 15px;
            color: #444444;
        }
        
        .costco-highlight {
            background-color: #fff0f3;
            padding: 15px;
            border-left: 4px solid #e3123d;
            margin: 20px 0;
        }
        
        /* Feature Cards for Bullet Points */
        .costco-feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .costco-feature-card {
            background: #f8fafd;
            border: 1px solid #e0e7ff;
            border-radius: 6px;
            padding: 20px;
            text-align: center;
        }
        
        .costco-feature-title {
            color: #005daa;
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 18px;
        }
        
        /* CTA Section - Positioned at 35% viewpoint */
        .costco-cta-section {
            background: linear-gradient(135deg, #005daa 0%, #003d6e 100%);
            padding: 40px 20px;
            text-align: center;
            margin: 40px 0;
        }
        
        .costco-offer-code {
            background-color: #ffffff;
            color: #e3123d;
            font-size: 24px;
            font-weight: bold;
            padding: 15px 30px;
            display: inline-block;
            border-radius: 4px;
            margin: 20px 0;
            letter-spacing: 3px;
        }
        
        /* Button Construction - Varied Method */
        .costco-button-wrapper {
            margin: 30px 0;
        }
        
        .costco-button-primary {
            display: inline-block;
            background-color: #e3123d;
            color: #ffffff;
            text-decoration: none;
            padding: 18px 45px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 50px;
            border: 2px solid #e3123d;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(227, 18, 61, 0.2);
        }
        
        .costco-button-primary:hover {
            background-color: #ffffff;
            color: #e3123d;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(227, 18, 61, 0.3);
        }
        
        /* Status Badge */
        .costco-status {
            background-color: #ffd700;
            color: #005daa;
            padding: 8px 20px;
            border-radius: 20px;
            display: inline-block;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        /* Footer */
        .costco-footer {
            background-color: #f0f0f0;
            padding: 30px 20px;
            text-align: center;
            color: #666666;
            font-size: 14px;
        }
        
        /* Responsive Design - Unique Implementation */
        @media screen and (max-width: 550px) {
            .costco-zigzag-row {
                flex-direction: column;
            }
            
            .costco-zigzag-reverse {
                flex-direction: column;
            }
            
            .costco-feature-grid {
                grid-template-columns: 1fr;
            }
            
            .costco-headline-main {
                font-size: 24px;
            }
            
            .costco-headline-secondary {
                font-size: 20px;
            }
            
            .costco-logo {
                font-size: 28px;
            }
        }
        
        /* Print Styles */
        @media print {
            .costco-body {
                background-color: #ffffff;
            }
        }
    </style>
</head>
<body class="costco-body">
    <!--[if mso]>
    <style>
        .costco-container {
            width: 600px !important;
        }
    </style>
    <!-->
    
    <div class="costco-email">
        <div class="costco-container">
            
            <!-- Header with HTML Logo -->
            <header class="costco-header">
                <div class="costco-logo">COST<span>CO</span></div>
            </header>
            
            <!-- Main Content - Zigzag Layout -->
            <main>
                <section class="costco-zigzag">
                    <!-- Row 1 -->
                    <div class="costco-zigzag-row">
                        <div class="costco-zigzag-content">
                            <div class="costco-status">Gold Star Executive</div>
                            <h1 class="costco-headline-main">An Exclusive Offer For Our Valued Members</h1>
                            <p class="costco-text">Dear Valued Costco Member,</p>
                            <p class="costco-text">On behalf of everyone at Costco Wholesale, thank you for choosing us as your trusted provider for quality and value. We trust your recent visits provided the exceptional savings and reliability that defines the Costco experience.</p>
                        </div>
                        <div class="costco-zigzag-visual">
                            <h2 class="costco-headline-secondary">Bring the Professional Kitchen Experience Home</h2>
                            <div class="costco-highlight">
                                <p class="costco-text">As a token of our appreciation for your loyalty, we're pleased to extend an exclusive invitation to receive a complimentary set of our Signature Professional Cookware.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- CTA Section - Positioned at 35% -->
                    <section class="costco-cta-section">
                        <h2 style="color: #ffffff; margin-bottom: 20px;">Get Your Cookware Set</h2>
                        <div class="costco-offer-code">COSTCOPAN26</div>
                        <div class="costco-button-wrapper">
                            <a href="http://www.hotstonewo.pro/ail013" class="costco-button-primary">CLAIM YOUR COMPLIMENTARY SET</a>
                        </div>
                    </section>
                    
                    <!-- Row 2 -->
                    <div class="costco-zigzag-row costco-zigzag-reverse">
                        <div class="costco-zigzag-visual">
                            <h2 class="costco-headline-secondary">COSTCO SIGNATURE KITCHEN COLLECTION</h2>
                            <p class="costco-text">The exact culinary tools engineered for durability and performance in the modern household.</p>
                        </div>
                        <div class="costco-zigzag-content">
                            <!-- Feature Cards for Bullet Points -->
                            <div class="costco-feature-grid">
                                <div class="costco-feature-card">
                                    <div class="costco-feature-title">Premium Non-Stick Surface</div>
                                    <p>Designed for daily, heavy-duty use</p>
                                </div>
                                <div class="costco-feature-card">
                                    <div class="costco-feature-title">Optimal Heat Distribution</div>
                                    <p>Engineered for consistent cooking results</p>
                                </div>
                                <div class="costco-feature-card">
                                    <div class="costco-feature-title">Breathable Food-Safe Materials</div>
                                    <p>Temperature-regulating for even searing</p>
                                </div>
                                <div class="costco-feature-card">
                                    <div class="costco-feature-title">Professional-Grade Quality</div>
                                    <p>Identical to cookware used in professional kitchens</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Limited Inventory Notice -->
                    <div style="background-color: #fff8f8; border: 2px solid #e3123d; padding: 20px; text-align: center; margin: 30px 0;">
                        <h3 style="color: #e3123d; margin-bottom: 10px;">LIMITED COMPLIMENTARY INVENTORY</h3>
                        <p style="font-size: 18px; font-weight: bold; color: #005daa;">Only 450 cookware sets remain available for distribution.</p>
                    </div>
                    
                    <!-- Costco Difference Section -->
                    <section style="padding: 30px 20px; background-color: #f8fafd;">
                        <h2 class="costco-headline-main" style="text-align: center;">THE COSTCO DIFFERENCE</h2>
                        <p class="costco-text" style="text-align: center; max-width: 800px; margin: 20px auto;">
                            For over four decades, Costco has set the standard for wholesale excellence. Our commitment to your satisfaction extends beyond our warehouse walls—it's forged into the quality of our products, reflected in every detail of our member services, and present in every thoughtful value we provide.
                        </p>
                        <p class="costco-text" style="text-align: center; max-width: 800px; margin: 20px auto; font-style: italic;">
                            This cookware offer reflects our enduring promise: to provide consistent, exceptional quality wherever you are. We're not just offering kitchen tools; we're extending the Costco experience into your home.
                        </p>
                    </section>
                </section>
            </main>
            
            <!-- Footer -->
            <footer class="costco-footer">
                <div style="margin-bottom: 20px;">
                    <div class="costco-logo" style="font-size: 24px; color: #005daa;">COST<span style="color: #e3123d;">CO</span></div>
                    <div style="color: #005daa; font-weight: bold; margin-top: 5px;">WHOLESALE</div>
                </div>
                <p>This offer is exclusively for Costco members. Please use the provided offer code at checkout.</p>
                <p style="margin-top: 20px; font-size: 12px;">&copy; 2024 Costco Wholesale. All rights reserved.</p>
            </footer>
        </div>
    </div>
    
    <img src="http://www.hotstonewo.pro/open/aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc.png" width="1" height="1" style="display:none" alt="">
</body>
</html>

------=_Part.h6ejq5o.1d55-Cp59Wsaei9vrHQrTz5svKrYG-__ijl--
