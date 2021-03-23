Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FE34596A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Mar 2021 09:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6FB89FDB;
	Tue, 23 Mar 2021 08:15:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic304-47.consmr.mail.ne1.yahoo.com
 (sonic304-47.consmr.mail.ne1.yahoo.com [66.163.191.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28689FDB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Mar 2021 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1616487322; bh=JDwVg1YeWij1bzVg6CXUMNyKMzRE7Mu8E1jiUyK+aHk=;
 h=Date:From:Reply-To:Subject:References:From:Subject:Reply-To;
 b=ooFsTY5EAprfI82yApn3M5Cy7+nvwDbr6ZzcdYNocsY95lQtMEdtHYHZteYG9RX1K7VJrnWB89YfcP6qJBEugkUSIA9DnDmybeWmhMYvWYp/03pmmlV49yCBgKxuzHyEa5EcrRz5LO9RpdBvl1VQz27Oct7fNi10ANyeDVDuhN0wgGn7uyb8YDe1BVB3//UXmWnjcMvqH/1I04DUM8QVjFxE1NYhKHxdfeAa38jOkvUbLlZn3Ay68bm/A5kzBIzxsIfYoLbGog5+9h3P6wY/Xl7Sk3YQtYwNgXI76ryIYb8ab4deRSKiMWspkRO1gDxmU4hsLPfLaJpDVE8YnLasoQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1616487322; bh=8Rv8tX77XvAEK09jmLfL3xiDgD3+wdjELNL+2BtwGSS=;
 h=X-Sonic-MF:Date:From:Subject:From:Subject;
 b=nGPkG3GC3b7q4SY0VZzPZd/3AqXsiEDxTd+1r97NmTi4IIzeSfv1TBrzllLQ6TJ2ywVwlXbeBxQ4gnqwPuHAOzrTFOcEgSIWJAIx1simP6US36U250E2VSEnzRpIK7y+9Cva15b3w2S0VuAEALaTUFlSAvJyJ6R9TZXvZKVXLqsJ9rb8ZInybOvZtfUvMAXWq8y1tWOXUlokyUsgWGHpz829Y3Lpg2TUoo9OJwVxbcmtfLbQWhw12Ar/SkjyMUXUJW7BZB1HWbS29+NAUIHbYQ4KXs3gLM1sfGX2njGdqhfCreYBuwWaBXD2cyUCIl+pBckNwiD3rZUdmXmYde1P3Q==
X-YMail-OSG: sxsFGrUVM1mxZZRlF3rYil6KvWxXSxb8R6SpbF_2SWw9Cx.BJmLAQYYNES23WSV
 .FQPZ31f29Q5fx0RaOK32YD31h0LPZonlGp5ynlkhlDaDZ1IqTmEZFDvFybdPlkVj38lKxiyvYDY
 S34TJXlCLWPAXgA6x0oEkg9FpNsV9Uj.GuuE2YES1Dkm67X3KCzQCzpbM3Uj3wY9E8ISQlv8evDq
 tb2sPLVn1Jc26PwMKvQfZ2pw7UdmegKzDn5rHO7u_4DzV0jD2z2V9plcGDolW0j93JcnEMRMGpT7
 DBJ9MTiyaIegfwHZcua_O0jXPpFkMDJi54g6zbvvmKvNeLFE2P0TQ90Ol.uSZFbOSXhrViJFIblp
 FLXTpsvRxJNSth2YiAbgaVjai4ES3m_wShqOLWZ103NH4LBEzumqXSb_qbp3uWnBeIqeob_GWLMw
 UX5XWQVRsnasEklRAiIdupxMKOOaZKAc.acb2v36Q6yjKDCmUWtXlZ6B.uW4hfWjYVGMnq2dJwur
 M_Jtuus8pdnUFCa6PkRQi__U0mr9_tzwr6KMislfWP5ihqSYSHTNFczCh.QFMyYmH8FgZs5eJYhk
 yBD7c.YdO0rq1YUy53ROaAWKLGThCwsWFwAV.0V8LPKEBqAgzzYWSHSQYL0_OT5v_djLw2gxDSe0
 80SHPFrpgZUIjMzhqslX9TfdAV4CabIF2CFMZr_xdZoezNnFcO6kV0a4LjwyJDk2B4zkoaDPBYz6
 rQO68tarfiaHs6DexH4LBZNElN5Y6SJoHQ_cqz4.6D6elOexsabyiiSiegHHGoypLcrbujwqm91t
 hadTNw5BQ5X63zuOZ2YMrFlFddNPY1L.HUt4uI2ejjzfpvvYONaeZpeXY4XPY.tWASTSR1NT_PfR
 nH1jnWIEr8yxcNzGWTqozBoKsn8SuJM69SPjKBGaV28oZ_8zBnOAKeEvI5o001oqYnTEnAAUIdgE
 6qcje.qdaMCNAqxFBsJL0UXN.iGTP8IyJb9zrcilEMG_LChqydLjqqktFv0mi_7Xvd2lXXfu_fBm
 mZPl2QkNw0xhHzh3CPf1P1p3oPgcrzTBCh6xfmM2nUt0vXy4Rz7zaSFs3ibBkM98gWKJDzLGhn__
 0dY6GLVJ5ASWZKkWLOFq0DzDw8auZnLAZaijlinT4j_NafnK3F4VyOh5I.sZG67Xm2mFfLm7EGQh
 DZesVMRHEkPshEvlydfzgG_aQcHsDPmqrL07DMANxZJ4CfkWr4SGYfx0OKJksyC2L3tDCoVn3WUr
 oTJHMnACOWqcXjf5t5PZwY4lb4zcT7o6jPAu9rbtvaP5.KAa6Cv_gACTY5D02dJfe2Otysg7srjr
 jlw95vNMgriM14bQU4UdhjCkw56H1XYDo8s3ru_Wxp9mskXkqU.BFu2mqSffH.1LY31fe4ndxday
 FkQfOP4DWStgYL1bAX2Fuq7CPxdWCz8LVE45YJOeOwafl7M2lA_JH1e0CxfhjYRTwlFhawD6isNi
 taczpyOn9vgTqFjHFSF0FEcNqRLXAC3kwfaqN6.fILjlXfnpTe_SEqXXJk5QU_.cIJIaz3VZtE.C
 rew2fUkq7drvffb2Rc.oha2VsDC_0_bwLoR7b9Xl9eRkg68N9Z_SbjhNXMbgrEAN1Gext8xl_mIG
 9pktYczsWeL8QGd0P9BlWi.wz.jlBPXj1IM3DxsgPmL1xvp8XU6Yb9XgHFJPgE0XY1TkPoDfjKcA
 x1.yOFXjvrzX_rtbJXt_PMaJIc_PNhiYdOHrEgHeQpv7MbhaWuVHc8lQhHfubJ_TyYhGxbi9FbHe
 .0OIz_JebbcIfQKtaxHE5Wq9yaYy4ldByzeYG9JPh0RPfefNeAQv_4H2Z2p.Sh_fbXFLrqb4DjfD
 9JiiIh8nLCFEazMHui7wECoasKGNl4iAZVJEA.zz61Jr6rrWFn3D6EowSZCIefeOVvuYJSd_vW42
 .nT1Vzeo02CDPUOmpjGlWVAjCv1BauNYitzPjESLcHWCapZVwGm1HcVpbmt8G841DJ4CXGk41KWz
 ThAtVxOP6PkoF3gNLTsZ080VbaS6v5t59g3pmnR8u_kkkkpR0PJoQPOsP1sZZeYDI2QN7NwblZ.N
 p53Cdys6.UxoXqFZrLl1mo04S.xneThX2otkNhK19uy2SiIwEHw3yAJaV5iPwBWHyT3doH1Tor3n
 kP4CaP7V0jA3CiVjwYlYiY5js2QoqRUBCgWt9hxEFWV1.HR1KDJDGRFuMQ3NsrFKmu0vCYi1U8Oi
 85wk33uPWa.VAi8beJDvY8EPdzL8tyzyAZcOYVU2bkx7vKTXgVF94UmHhGPRgvU8jLZt6dxHJNsK
 UCSnlEf0IvO.MfWmmKxtTurUy24ndF5QpF_yNVl5o8qFCFSk9yd3zmD7HUZouEimPfnJ5UC.3qw7
 N4dnPjxq3.McIFANiSQbfnWwyb.ZTVCv.tq_R2y5mbW88CnHXboIujf7mKUGybst0rvBIgWocKRR
 wWMCm6qWe8nBcMHgMVVDSU6_7wyALzG1g7UAMGWz9PhCV4BeiexDFB3EyUp92KE2jMawKH2huiVh
 aOa.JaM5tVC7mKUHMmjMf8R6DTbN17nFyKjDp0IiFc0yUblSt58Oid4K8mXPHkEtYUDTYnPF6xhS
 dDglVeO.Ixsk_n5mS6VGhPj8bwTr6g61k5Q06R0Wnn3m92XvyyGCiFDzbSZOZupOSQA4apRBYigE
 dROws_BKMAkYdsWOetaC7SvaXyFz_cchDiQaEwsgkQTOcxj9H117lYmgxqhWQFtoxSeVPzSQj792
 6vmZevz6fM4Rjsmg69ZDA9eWczyr4BqEtKRE5cYtJlwPhopDEemVaWar_dDSsEIX1gr7u61_BnTd
 qo9vAznA3a.JM7d74Kuuz7EJoIScNBzhRsNrVZsSb3qbCP2GlV6ekcEl7IqOXQW4Cl9M7.ZYIwR0
 FKItukd5AO4aio87DGIezbPAtYAP11HP_esqftu5F0gad_R7qFgfx4hlAJnggLgId.YB.LAjOAUa
 scNEd6fdmfWHC2bYO5Mn.wHA64oLKuI63QgyAP3mjFKIEolARoEUtHdjc_tXr9I5ehy5.TOi5A36
 S9eu3Vjwkzo2m43a.Gls7eiW3Dyie.TJlteovL8u6tpVghbsloX3CXMVM4ShpFWKRZflkJa5_qBI
 j0Ca2X1naIm6si3AAjdxirABb9d5rsSPxLLpRIaU9MV9huuRiD5if1bM7fnFq9UdJ4v2.H8Xlyiw
 zBvbvq6rSiPvC7xY3FKVaSinueHd_6.QN8PE2i1bmqYCDTvbXLgP9t3lzp8.uB7G1FSmI.ebl32_
 LRY2xXhiUiSNSJoFjrSuuDNjiSuUiwksXzwZH9IBywQ8Ip9C6.IOaKd988m0jIorPXsDn6ps2b_X
 22W6_IMxlDCCtVMXwrg_Mc0xdj90peexveHJLHDcDzanLzQBGPNEOmm0t9B_.1bF2k5mpr3y6FHs
 Mu4wQnd6ZylB56yitz7A.KujWcP2tVHFJVvQfiL2oUTfePt6ztSj0Z_cIO.nRaWIxnLnZg5PUTS8
 FwdbcgP5CaQ.43W5FSyxSNtmIOGwZAAYWxPSuluS4Udo2Kw3Uj0Y96iqMMe07sRlnvsyVhvAOoG9
 uSaMhAAN44wnDQ3jpn1oDc1ZdQ2xD9sN4A_3ewHjWmCJPYgGPatSXp174KbOVrOvGYjXPh7qa35O
 OGnip8LwPVBm6_0k8.jvQFpPg8JqEX_z_kmI4if8vxJxf45Gz.bi7nIGeorBaEkreB.7znn7ZQYz
 JFaQDq0TQTKW6Oe5sdSvYbwMFq3d7Xj7TFfI9rn_.UA9uO_FM9L465ub3WA16rxAO6aSgpW44Axr
 TM8YJjOKxVlUzRG0o2zarp6l6__SgW8XIBNEyS2aQtnpBan6P52zJmMTG9dPHyEaQqV.2MjNbDFL
 Hvfb_kLHXQnwqlMkizhytTq36menVpJ9KSWOc90vWulf_fC4hkcAUQ_RM0rAHiPVHh8y9pBZSYYo
 9zqIE1o8Njn0yz7PYtq87AHgh4Usvm9uLio3Eynk2axcVzJwkoPFdNre_EqWROaiDnd.BiVQM03_
 pkT2WfEh26ZCbrgqIYOPIxTpmYgCg3H2INn7U8lhY6MPfzi3Dd32U34MYxSHouk0Nl4r2vFfpwOB
 yuykwhmcl.kPPhLPlvNYSj7.OQbIHB090s0vJo4GFjyz_lfqbL.5i4LiMYT2RchasR1gmrI57GUK
 2S_1_wTYyMRn8Cg3JpLb7qaNvXJS6Rl86DsGDrVMN_m2n_xDDhNhqBfI5YeVF.wgFZPa7ALRu8Ou
 qXE9GSbjnhEJX7eD.9bJNA6VbcWm4BgOsW3TqP8LFkpSk5OSsbrg1F_8Pyn64uRkK4xSSs7IBYtp
 anFWY17o7wgOxDQgmFJ0Kr.BccQ2AGANjBT1yu1KJWaSEZ4bzzbwu3_qVWqHg6O7EcD7A57w4JRP
 8e7YXTLMjNj2RxrF3rWoQ0PyIal9_6pZ1yPbx6wAcI.PBA7n1FdAl1yqpYr.yP2w9sxhN2.QI30L
 CreHqIvPL0w8OHiBJ.vkRtOWHgEbeHlYL4zy7YmVj4vKJMnC_j5i5_cD781vD3HELMXACaPaiM1P
 Au_aM_qiVkrYYw2uYNLbR3HJx0WwBAcsk2VRDsQZyBAU1zokIxJJRN8BKAEi9v0AVQHrS4KNYmS_
 ovbx8.i1bZfXMglcupYaL7fbNInAEPPjb05Xvgfs3w_dUOQ2k6eS37YfsJyg7vil6hJG3MHWNzVC
 Q2erNPOVPvrz.YnQS_Ds7A8hVawUpnzCxVtspRkMfZMVdZZKra8sHJnZG_G.ZZS7VoBXINS81A1r
 d7MCK1qJ51uQjFYYihXCjBvip90IFFk9fM2ouIeZC3Ynqkdgktd3llbX38xlNBj2f52EyGdKEvsJ
 Clzhr31vn2LPWh9..x97_1I8GcdMxZoF2gwIrNIeyp7brLRaDXGmj.26YCkJ7VsBNsrIQSJI0bbG
 vsZxi2XZZmswlZz1Ou82EfrJW_OWXwRQJa.jh4jNqKw.LxoD_fSUGOQXgOQMoSslvUPdZJsgpprC
 HXIc1Q3HiXgFlwMc2eRhFAqq6lUKD480sTrpqr3KtsiAeCF4lQ3vVFiYtlxNccxg6xA5wR4laJwj
 GuvofE5B0ubv4R_PUV7kY8bOIkRuCeVAx7xqeSvtGOD8Ot4gGhzz2rp3BiXADsHPuRAsbxLmW35k
 0L4t.vA3yAZUlIG3mYEydRLE.Aactu9LcAtSftlfe8s5SOXp8VQSOFRtdrV7tG4g4jpqJyDVF8_E
 kTYisKvre_qokNCO_l3U.1GYLRskmt1fP8yYC52d_SjgLDzsDJJ1MA4X9wVhs_KnhUac1hyVyxrc
 coiPIm6aH9yLMbLdEBRcYfVGWv6Iq5etG4tU3H4XpsX8wdVkVQ4UY4a9cu.UiWuobw2GtmBzcPBq
 N.8FltOnrkOxuaEzgTAeHO1.MmRBwQfWBeEVsS4ixXjBzrAnwsOC4uyI6Fa9AhMCyn8YMg_bGkVf
 Ht.3QQXos5cP7ClZqBdhVw1RfhNsdRbD2eGHgAtXh
X-Sonic-MF: <mariamsterbenc@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 23 Mar 2021 08:15:22 +0000
Date: Tue, 23 Mar 2021 08:13:20 +0000 (UTC)
From: Peter Florian <mariamsterbenc@yahoo.com>
Message-ID: <1555803346.4172832.1616487200900@mail.yahoo.com>
Subject: Hello,
MIME-Version: 1.0
References: <1555803346.4172832.1616487200900.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17936 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90
 Safari/537.36
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
Reply-To: peterflorian019@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



Hello,


My name is Mrs. Peter Florian and I am a British Citizen. My husband died recently on Coronavirus and I am presently in hospital suffering Cancer Disease. My husband has a deposit of 15.200.000 GBP in a prime Bank here in London. Before my husband was taken to Isolation center where he died, he told me to use the funds to establish animal care clinics. We have special love for animals. Due to my present health condition, I will not be able to handle this project. Therefore, I want to donate the 15.200.000.00 GBP to you so that you will set up an animal care Foundation in your country. A clinic where animals will be treated in your country for free. I see in television that people donates funds to orphanage homes and don't care about animals. I and my husband wants to make a difference in the world to let people understand that animals are important to nature. Please let me know your interest so that I will ask my lawyer to prepare a contract Agreement on your name. Please don't forge
 t that my health condition is bad, therefore I want you to reply this message as soon as possible so you will receive the funds before anything happens to me. I am waiting to hear from you.


Thank you,
Mrs. Peter Florian
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
