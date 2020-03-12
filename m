Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC6182F18
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Mar 2020 12:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACC66E184;
	Thu, 12 Mar 2020 11:26:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic306-19.consmr.mail.gq1.yahoo.com
 (sonic306-19.consmr.mail.gq1.yahoo.com [98.137.68.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56C46E184
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Mar 2020 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1584012406; bh=8xpm+cacAfAnFCbwSdgMceaBJxowNWaFZvEVU/zxgKw=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=r7CrvTxrWCpW+8mUowmjnu2ivLbvyFeHbpdEBOoECYx+QuOGuOW9F0oNuONX1sy80knVPaI+ZQtgdSZE8UfJ5IqBfyUL/hvUouXF7bAnIyXIPrJzJLsbQPMYBPS3yTueCl3ntKczYkyL7zfWf2iQK+CZ0gf6QRH/iTUO1qDNVL7sacigiGXCUwNpC7eU4JGxVZitgxsKIk/bwEl3E65qrsITECO1SycGui3bFat/tpI6ybpK/6ErR890Z9oivenwnFbCuta4QDnhYDFxaWchpb0vog9PBmK8exCFXmh5uHgwUBMVbkXyB4hSyMhUEmBRdfDzbJbivP7UxfxHzhxG2g==
X-YMail-OSG: 2vcs4iYVM1m4PI7QsUmNo61OAZOBT56h0CF1qkNKcsrWmocrhB5V4n.NyzA9rCL
 gEyVfZ9eioEPUmlNkPEEQTqABlu8PI2Xfb5G9emlZnAds5F2qso2N3MeBUcxK88fYG_m_P8KEZL5
 pfuJNu5ikdhX752zvtHCM5lrUsKsqYovhMiIa.V9i6OI1FHFxKmAZEj7RLzLlvvEmABoRgtmwh1Z
 FhOdxG.7BLEMVJaca3Rq98jVpYCNSxfjJmDPu7gfgRmzDQ15fKa6YY6_qlN.E2ovN2HmwkAUPv7k
 7M5OfrzBt3mNZ5VkaM6Ql3rWG8cUO2f.qwRrkrpWwvU8jURanHeVv6uhyJHi7JA80wOG8sCjUtu9
 Dn6nxXFAvKZoYxSl2Z5iPjtz8xvh9sj0YLufo7Xu1.eHCi_dhiBJyUstfb_uh102xITk883iU2Bc
 5LMYm65NzJI3XZmgxM72woRA_9d.yPITMsv0kB8.amLQbqzMLQbCZv0u0S8TMO.PRXDWaa3UzpJA
 StJ5BhxhaiowudRKbPFtozPRDL5HB_ft8n1zOSE54R8CD4aQMPhdL9Dja059KQ4nxJM9rsqhJOFu
 ndc2IdIqqQU9oSvd4N7RnyQKY7oKG5I1WSgb8kFWqiQERr2nIMVjxdGm5lmXBFTyw9SKacsMCZyV
 rOtlAhbldGBf4dfXTxE4tYXwCak6MRw9o4JK4CLUs86UpgOJPRsmZoCTfZD4x0UCHbY07CMpWRVX
 F7g3hE3nPE..wg8Z4HksdDCEBuHtIUvnFytHXKB1_j3IXVhJ.4dbCXVTM8uB0DKxmXflf2fZnW_u
 06moDaFNElOigqwzohrZTwvytrmz3H2qATOO4Woyq2SNbKKrnCRc4g6xuNYmUBceZwoO8RZXleN2
 mQLuiET4Bz0E.PGskiKKfFCv0pefQBmWPDJW1mlbEudd6FBO5rh2JZ_yo1Tssexg0BTgvNpzdFeu
 xwHZ9BKwYZ0IrvWtrznEJoZHQAfZAUu7sae9o2_xCLIHJ65_lb35mHm.8ApUZzs_EEqT52dDLYM4
 dm64F8tJnlzHKKTC.LHK2CkzrqZ21bNwgmBH.B3pzPFsZd2e29QxelGzuXulHwZLXoOyNf0YYBrM
 qIRehJWPGYu5v5FdJ801et5x081LjKiBpYL8kugzwAqxdIKNLsHEjWElNyLLqA7rKUdY80fqFef_
 qEBNFS0gU_5Q.TJjJXxpZ_e5kWvbkvQGFORkVz.fnHTOx32GImeqDlKpvRSzynN.zQ55CpnPWdWx
 t4pL5wshXqVY8tmcdESHnwkZY2_WOzin8AWpjCEgxfFAAfef90urlg2d16UvbtDVtaARS
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Thu, 12 Mar 2020 11:26:46 +0000
Date: Thu, 12 Mar 2020 11:26:42 +0000 (UTC)
From: Ttiti Roseline <aomrisa@yahoo.com>
Message-ID: <751881961.4373713.1584012402919@mail.yahoo.com>
Subject: My Dear
MIME-Version: 1.0
References: <751881961.4373713.1584012402919.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64; rv:73.0) Gecko/20100101 Firefox/73.0
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
Reply-To: cheriftiti268@yahoo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

 My Dear

I am Miss cherif Titi,20 years old and the only daughter of my late parents Dr.Richard Tit. My father was a highly reputable real estate developer who operated in the capital city of Ivory coast during his days

It is sad to say that he passed away mysteriously in UK during one of his business trips abroad year 12th. JUNE 12, 2014. Though his sudden death, But God knows the truth! My mother died when I was just 4 years old,and since then my father took me so special Before his death on JUNE 12, 2014 he called his secretary who accompanied him to the hospital and told him that he has the sum of Nine million,five hundred thousand United State Dollars.(USD$9.500,000) left in bank

He further told him that he deposited the money in my name, and finally issued a written instruction to his lawyer whom he said is in possession of all the necessary legal documents to this fund

I am just 20 years old and a university undergraduate and really don't know what to do. Now I want an account overseas where I can transfer this funds. This is because I have suffered a lot of set backs as a result of incessant political crisis here in Ivory coast. The death of my father actually brought sorrow to my life

Dear, I am in a sincere desire of your humble assistance in this regards,Your suggestions and ideas will be highly regarded.


Now permit me to ask these few questions:

1. Can you honestly help me as your daughter

2. Can I completely trust you

3. What percentage of the total amount in question will be good for you after the money is in your account

Please contact me with my private email cheriftiti268@yahoo.com


Please,Consider this and get back to me as soon as possible.


My sincere regards,
Mrs.cherif TITI
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
