Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97051FF37F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jun 2020 15:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B46E42D;
	Thu, 18 Jun 2020 13:45:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
 (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498F6E42D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jun 2020 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1592487921; bh=fH/bCqhO+/rdrFrxud7WLZNywhlisn3LiimgndMH2Zo=;
 h=Date:From:To:Subject:References:From:Subject;
 b=Hq5XkaRq6PMnIuf2ALOLycybX695E0BUM9BvxrT7+wPOl7Vquvf/L0gnv9n/7N32kRplrFXAaSwnbyAVB7LOGwVPvH31Ja93zyt9HsAk47EPBj/Z9ZSs7DoRNjD1H4s/ERKeTv6En5Dz6UzF87kBTfDvmSlB4Ia/wH3EDN2iDdx0vGGIvDphoYjnDUjaLPXMt1QLpUfi0cz6LJK0Z2yK5rDg3mP4Xo36i6uGvKyEpMyF7OllJ6/Alzs2WOc35voJg5E9Xb/YYbJmxWoz/2gLS5VDnG1+EsOqbQ1TDcu82eS2F977KK+1A2cCkU3ejlW+g9K4P3CQEKEo3Ba3s46rHg==
X-YMail-OSG: 75RrrRQVM1n_XwfHJbjBdYZAP_UxMVWa2387uuSEvlTngKV0amaTI8SM6Zs.S70
 s1K8.41V9pHVlkcu6sT8XWPQn6dF5XwOMYmAQaSoZDcxZwGN.mi4F9VTqz0hjXsNlSZjEIpTVt_Y
 K.qYc09J.oFTT5ZlILLyv6AN2B8Y9zd6fS_HKMfm6TMMTYWgsf.y9ZVAI159P3gvUZK0.iVZrmyn
 nIIcT7Am6Rca6cu0TSrM.T3DCqhTPsvt.X_P4AMQKYENTnKOTmD98E3Gag734_p4fyhL1G4je_dX
 IhqjZ5sfuOunLR5N9iQZN2qwG_yeogTKzeaWPcQTEZK_sVPenh4MP6MN_pBQN5yF5rcH3HCw9ImY
 EtCY3BjTzkor0pvnzwDynhJkNIE.DOdfI04tkfR_9Mim0D2LzmGhvw_fQwHjTIKhBxYtNSJ1rH.c
 Z91fkg.1BqBhkBxBENqATIz2oVilY5MLeh5Aa.RRPWAmNIc94lG5D3_QtqDtQnJIbKqHLIVHWd71
 zW8.BIRVxDV2Ci5yWDskcAfIcXothPXCQ_M6hBe10uGC5wi0fcUu5jLX4BbqXWjzNlSRuCdXueZY
 8.dl_.rRh3SlDA_q1oEF7N.qbU1KsZIm9Yeq_iaLsOPzaOZZO_fvar4do8v0d_PQ_K0SNkLZV21c
 5Jr._Ut31wustWQyvwHjkQqSxkITgv2MOjiDc4PbasFBjjpqAnVgVdARUf1OxJH_SmLUvjZfqR9v
 lqLnPYGDnomiDv.eWhyH3pLOrFVIkTS0Wl0czBOiiezlT0IpXIjd3vYgG1ve0X61OpifsEWicVEd
 b0IHjrDEIkQXiz3Q.LnFCJN_6wGWUfF.VNfkuaVpil0cuBdJc4qYGYDjplLXdIrdZB9Ny0ryMvmg
 iTZCG8QAqmZbqZpJkLVRV7F.hATYoKJb8nl0CkTi2Ga8FywsxanMzo3CQ5JfWi0BiORBaqBpLTru
 uO.x5p2odq.D8YwDz54Q7mBqGQTB4lgxhVxFgECpmsbqcLb3aoygo35Xzxbl6bpsIBkywLOpfS_H
 SWsJoTWUUJp1BCF8VBPLFiDcxOxNMpmWnsbivQOG8ut9pdsPIeDBKIt_DTOCnyutGZPfbCkP_7uP
 anPSvIH.PARv4KQ3vDcc.FVTRwaVioHv0wdLbmLtm7rpRP_lLNj_N.U2y13MH.BJoHKfGY7zo9cL
 p5dnHrKH4Z.HuNGHLcWiGVd5LxBhGK7W2fW2f6HHC4wnqHKhyL.iw6aV33U4vr84pI.sCCowp.sH
 k0IYGGvrEOodGadAkroQkBRwnXSpe03dw3UDs1b4b_HXlizyqHvJ3UL6gsdygWUafFw882LxE4YF
 9nR2LZ2TGsKPb0VOGL6DG
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Thu, 18 Jun 2020 13:45:21 +0000
Date: Thu, 18 Jun 2020 13:45:20 +0000 (UTC)
From: Daniel Patrick <daniel.patrick101@yahoo.com>
To: daniel.patrick101@yahoo.com
Message-ID: <746197392.549258.1592487920328@mail.yahoo.com>
Subject: Good News Dear Good Friend,
MIME-Version: 1.0
References: <746197392.549258.1592487920328.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16138 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0;
 Windows NT 6.1; Trident/4.0; GTB7.5; SLCC2; .NET CLR 2.0.50727;
 .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Good News Dear Good Friend,

I am happy to inform you about my success in getting those funds transferred under the co-operation of a new partner from Germany.

Presently I'm in Germany for investment projects with my own share of the total sum. Meanwhile, I didn't forget your past efforts and attempts to assist me in transferring those funds despite that it failed us some how, now contact my Lawyer through his contact details here below THOUGH he is in Africa Ivory Coast.

Name: Barrister Ego Amaka
Tel: +225 55 66 29 45
Email:  barristeregoamaka@yahoo.fr

He is in Abidjan Ivory Coast, his name is Barr. Ego Amaka, ask him to send you the Cheque of $150,000.00 USD (One Hundred and Fifty Thousand United State Dollars) which i kept for your compensation for all your past efforts and attempts to assist me in this matter. I appreciated your efforts to help me at that time very much.

Feel free and get in touch with him and please do let me know immediately you receive the Cheque so that we can share the joy together after all the suffering at that time. at the moment, I'm very busy here because of the investment projects which I and my new partner are having at hand now.

I have forwarded instruction to my Lawyer on your behalf to receive the cheque, so feel free to get in touch with him, he will send it to you without any delay.

For your information, I gaved the Lawyer $100 USD incase of any expences during the Cheque delivery to you in your country please take note.

Remain Blessed
Daniel Patrick.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
