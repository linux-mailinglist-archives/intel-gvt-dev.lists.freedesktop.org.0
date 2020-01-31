Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99914F538
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Feb 2020 00:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21276FC58;
	Fri, 31 Jan 2020 23:32:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32A6FC59
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 Jan 2020 23:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s2048;
 t=1580513557; bh=8xpm+cacAfAnFCbwSdgMceaBJxowNWaFZvEVU/zxgKw=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=gXttCFosS7QN5By5jHT8iuaaPvKchiFZTIyZ9uJyHj3Cfdzvdirb3VgxwJ7JWL7K6mPLSNexianczxVcYT2gd2jm+cuENIvYMlQ/jKVN2rtNAxCyhTgU65mOCWrf2ew08mJ1vNRKD4wlXN2ZfEa/4eg1jdIBuvqzGm0ozGVdG6d+wJDtTBU0iDgJ7beHC2a6lqAZ4Bx8arAXizIIIJn3chFtM8DTG/tIKl4pszPfbEekGJID8bd2iv8eDqx8m6zgkn+Fg8+v2nm87OkPpWeUZ5zkiRRYPxddbIDHAXDyZD0eRcSY5PB7aYO/AB3hR6IUMW2Hndd3Whgd8ugbnNDZeQ==
X-YMail-OSG: bggbNE0VM1mu8jzwloKWhwSxJdcNKgaHOMZX_dP4X1x7Ro.A4qC2HCs_aBQM9Q2
 2HnHbMJ8HNyQc04V4ulof43szwd0bsbWUU.67jar.z0abY1UW6L.4ZOC8r72HiRr4fgHe1fEtkQX
 UdERuv43NduzLWk5UlCeKnCglLHlBGzFmtuMmzL8ztPP0J1qQy7B7tr8vvjHCBQ0BIxLSXdr1OqB
 tTv23jaPTajiZ3uvfGJ8ZJj0uBWT2y.La2oebyR1y09UB3M1y.7DwyuUyEVLh94j944ocwAEgkXw
 mjvt4Yl8.S5eZLaorPcL2haHZTB.6ShUPgIGOWk1BmDBUbA3n.B3iuYNosfFON6kZOY_WMEaK4Wu
 R0tJ.n2gRI0vZNKVyBxcj0tKAtJEcmCZy2Ufs2SA8BFHkFOEb2FsWiUU9MHaCya.EWpbRDi_v2lf
 1esOmD.aTJ3ggxaNDAQUYaxZdSaVmf3iet3MwQSY5ys5cIsIq29J8mOwXJ6g8CZ4Y8SWZHGG_1V_
 XG60.bqOgw8sN_.3V3b.o5IQ5oLhbyNQLivjNWLFUeuL5CD9bWQx88i.WwtmPmdjzsyQ4zZSulAE
 mKVqKOkMwq8n.3czlmKLw.5Jltf4GPcedBM3J5yyjuU9ywCjz8zNEUwyrH.YorCBePJGTrtMf8Sf
 6ko0lCsq.GvmnPtFU9T1Xmzt5yWsfup4sf7wkn3qBBQ8VDOfBDc7ZFiRP8Mlo2TVURo6ErKWWZ1R
 nChK.BH88K0zzrEtoLDHmFR9datBv46Ej4v1_4.NG3_LMFfqWHBC147_u0SqnN4Te2H4PfOphHMh
 XePQ87d9mgRVFLqF2Db6C.Ez8ZJZVkPFUU8Y3AVYRuIz98XqQWDaM.5gglaNJ_zr.u4ZluQbVisG
 sJNywp.iNJAtqr10cUkxkNK5p5UZAqWp12ZVJlN1v6OjHu9brwlsueJ2gLzH4OFE0hhO9uSq_uU8
 5MGgf.AJuurm1u_ps.aZtS2pLuTUMwS3QoZgchR14AdrCsqnSqC.2ZH_3wV1ibhRuAkKh121Ftg9
 kKZo5jkJ9OY84i9p0ZEi7QpnWZc5TL0rOnwEhWevPFxPuS2lHjJivmR9tywF0dL_tkjce9iJGGoe
 k_3gr_adWb4t17FrTnGVINZeXz0RG4mUHFeTRj.hGTSaZ4J5mbpIkoG5PWCJaDD.w6nsmbRGS3S.
 v0PcV9CafbM88FArg_l.hMFM9TgdNR5J1YnRzDzgxK_yQcUjR5Fz.ThV2nDWUK0kv226FdXr_GA3
 32lmbMzJM.2VBbGdcmkkWzEnu5S214wPJBaG9Mifaj0LxaDrEHdM7gMdfLDS437S2cWtur2JiKyn
 sH58_
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 31 Jan 2020 23:32:37 +0000
Date: Fri, 31 Jan 2020 23:32:35 +0000 (UTC)
From: Cherif Titi <elpumita@ymail.com>
Message-ID: <621258697.37410.1580513555720@mail.yahoo.com>
Subject: My Dear
MIME-Version: 1.0
References: <621258697.37410.1580513555720.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15149 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64; rv:72.0) Gecko/20100101 Firefox/72.0
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
