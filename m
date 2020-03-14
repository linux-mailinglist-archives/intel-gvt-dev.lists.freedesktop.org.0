Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79155185682
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 14 Mar 2020 23:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A4F6E0DA;
	Sat, 14 Mar 2020 22:18:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic301-22.consmr.mail.ir2.yahoo.com
 (sonic301-22.consmr.mail.ir2.yahoo.com [77.238.176.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431C6E0ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 14 Mar 2020 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1584224327; bh=yQ8j5nOiL1AB9VzjpcatQY3Gp/1Xq/WgkFt4Qo+Pvao=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=pbTnkGnZUktM8ilba0q5AV2hdUwBfhNTz2wLTuMc61UrWDNZo6R7tNWDvnelk71yhbuXbxVDm9aWfYoaB9bqeeVYOdFs2dsJed0Q5vtiMYnbT8I+KATeDkX2y6HphCOMwoHk6AOisHnepMYSdKFmFpVH3BzwPrWgsAR8oJhl/OFpdMTXDCoOms1PcW9bnCU6fy7qEg0/dOPFOX6l3BXuRO3+j5aooIXCRtFolOLK4Uo+bISJyuTG0PNYTMLrsCsWhvpsLM40Gp40aA+mumNToRfallrVBqkdWgieMieo6bl+J0hU2KzGa0UwlBpf01QHbH/cOn/wq3mwwcRFid/jzA==
X-YMail-OSG: yFHLyTIVM1nYl4vXc9wqVSP8SMgQi9FrQFkM9VJhSr2vXLI8RYMGGcAEHDW1hbb
 IPEZjKNE_BiCs9lvUBPDWu_nskiqO8J_br0tXeIIanEBd4f4TgqvbpX8NcL9jtX_alZ7TSdq4R3h
 Q5GioZohrf1aUwnqK7lco1BeQcBs4jWg8kKvCZ36LhWebLIHeIa33.Na6xzhZIhkTVQlfleyg57U
 6WWJa.syaQE8oGpImc0fLeql2XWlJpbZ0yL8Sskey1WzNoO0GnVycRUXnvfFo8BzKwp3QpvtaIV8
 r_oTVin5IdGsw0eb03GBozHCkY.YnC1N5rpbVVUHDKZ_wlZq53LhVkG5X_Te_LCpUlcxGWa13YXS
 _eSZy5SPQ47W0EhkjcOx8i55ChFLPBiRCua5Gmc8KHn2gxMnZVgnbrlgeI._wYle_FKUCwS9iEob
 8JZ5QnzHaElNV8kBPrTSVu4BI61JrbqimwVh.Qe1UHW2kGsMsG24DiHniaLA10EfLtoOt4AFfPe_
 2vNmJguEcrKkBU.oOzThdsx78trKS3Z3C83IvII5JctiwDDfZ2d5Zbjn9BP_LCKZHex7Rgy3LLZj
 zStqgOc3ZSv9jbApd_b5ugBkIg2a6Nti84B2pEsJl5Z3OEnmUUAoTMaX70m8xqqc8nia2ahb9XNU
 TvpaGocjTs2pE5AfIls4XFOBFoyPEZCyr1R1gIxnmUJhlWHxLxHgV3WZkyhfcquTAs8wD_fx9XO1
 vs1X.uBGZwuxDN2Xkh1sLqYpom3ePbXGZPCw1O7w4HKehDC3QUv9dZCVaXSnmhBk7Rrdd3cZaL2q
 D1adcmAqTNTZqG_5Pg4YY82yKVYbJcVmrNz8RDvP.R6cOKra1jXOuXVSJy1x0pffAvyStTKxSXfM
 Rk47cdiAnOdrVnBBOonMS2dcPtOd0ePFtzmSCLk1MFGJSBFeMhiWVZKzMSMeUDmuokOa9fr43nN9
 kqaS.zWbyR02fF6ouLimWlsihrmmVvvMR6SqCnL.2Jm_8MmA_0QD0kncHDKD1kVAF.Hx1_F7d3Ui
 zAh.8x6PCdO98ZdnTeYB2oLKXkE10rSzt9daUFy.Eb7CEuqEblsbRmAHeiYjn7VX.w_fBBJVBGa2
 UjGDeta3_z9nbw8fvHv0spIQT5MnWC81SHNPD3u1pbjRpFDe3WumMaPt7DK.wFCGT.u7dD8DSLMC
 3JfG0RCMv9cp7ssaULoPdjxOyY5_5GEQXO_EzA9UjVASPrHej4o46EMSFm3fDhW4BtRYDac0SE78
 2Ufl5iG7OrGMfa..euCUKTuu.k0AOKeWpijuGbRg5iu0MiHnim6SNVBla7KkXT_lGLhfoqQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ir2.yahoo.com with HTTP; Sat, 14 Mar 2020 22:18:47 +0000
Date: Sat, 14 Mar 2020 22:18:46 +0000 (UTC)
From: Olatunji Martins <mark_esq@yahoo.fr>
Message-ID: <1801770019.1279487.1584224326133@mail.yahoo.com>
Subject: Greetings
MIME-Version: 1.0
References: <1801770019.1279487.1584224326133.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64; rv:74.0) Gecko/20100101 Firefox/74.0
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
Reply-To: barrolatunjimartins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Greetings I am Barrister Olatunji Martins, personal attorney to my late client who left the sum of 10.5million dollars in his account and die along with his family. so i need a serious person who is willing and capable to work with me with honest and trust to enable us proceed in details. Barrister Olatunji Martins,
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
