Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED752641A7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 11:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5289EB4;
	Thu, 10 Sep 2020 09:26:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic305-1.consmr.mail.bf2.yahoo.com
 (sonic305-1.consmr.mail.bf2.yahoo.com [74.6.133.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71CB89EB7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1599729981; bh=GIslt9wQR8F4NESZCVXXpFf3iW5Q5Osnbck8IUhCqf4=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=lNwDYQhJrfiW+UDfAFWEZx4E30sH4xp903eNLrMBRFvlkYG5dPPp8A3k10iV9ZJVKiNKJm37ItTio2b96buAXhkj5Rh8hp6p0GC8wTu9/Qj8L4HdCouA05IbHe0DZ3GmaTmRyfsrLfNAMMCGmEF7QK4Pr6YwCl1jZeTxWsC5qRMsC7K8J7DQEnN+iiOq0RZnh84T6heG0wRjf0cBSG7jLawjtHREmnhMA4OGa3vTFlaYJ3ptrNhj6g+5YIJLRC7WLwsLqPoxo+MF+oWhKmY+F89XRWk6UqqfRH127DGKF/VYtl6lNgoUNtoWLUasodKMRv7W+IT411cvVVWTGQ/cmw==
X-YMail-OSG: 2bMfL7EVM1nXmbA_MLSDNnowWx8OkAno9Y0PgyyifDj_Yrp5tGYlf5hDBvKfVbQ
 DPciXCK5F7LgO4MLplB5hm1uAU0wJ2IpwwNIBYTc_zBs2SQVS8EW6O00jlPZVJCpiF8Wo1T_7GBv
 xZa3maVgiP2aIq10bE3j6HXe9KSrG8dkFSNDHM341eGJhGXRyt5M.raUgSVsH3kHDVX4gQq_tKEY
 kErAFxUzyA5TzNeeRdLBKpP9iP64BWk8.HNfZv1yWN_qdwrLCZzplnwe7q.G.IX1aY7MHvP8akF1
 9OPsFRd0V2ZhVS8GiutGYUS7Va2zYvkn8ZV8gOUc5EyCn8RKVU_R4qR8Ml2f2Al3b9LY3T1sw6eT
 cFAkXgYpJYFquvmdVsj3s8PmFgpLXWUIkHABTaMETMCpoT8_8PywTu6Ergcj45DJfdBk4APFG.X7
 xzv3cAJ_HswiujciKu0m.6rEnVn0NeSwINZobHtzyqeY1tZxk2Zj4TfaoLhfou6bs9rsln1bu_ip
 Iq6R8SoYAEA4rNNpKi1GsZetUnChlBYGcBNZShriDG36nFPimxSZrsIQFJfwRl_aH0T4cRKjtOVw
 hE_ylMJFgpwdYFCALRok6GI3IqdqZmLf.xbPVAbaSz2Kub8.47CILUg_zrqb815nEMs3NPh97qSs
 X0sqihi_A6Tv1lp8kNIrYsATtu.tvCh5Rx.Ev6P3jzDXi9kU_qCmzWMs.59yZ8C1gji_p5noQSlT
 fOIE6QwTBz3RhaZP6q47HhZkFcS.A5d5xXn0qiHLJw.D4lCalGW_NTD1R0sRt_iaRK2ZEnEtusr.
 SDpudKJLhbXJRXoJ9VwCHTJ5Nybcy04CxXZHvklLEGnzgXqYE5ME3siS7gekWw5j0h7HWpywrX3f
 Rdq2K5qVuaroGpppJnsMmzJD3AwE7ozYst9ZFSFbMGwYx50Uho3XEnf8UFuQwSKGw07O_mgYJF02
 GRe99U6pVvJA_VSEVcQ.Yt.raqiLBTKj_b.efgmuEGiTOwH9520eVklC4ompjEfikpdExgW294TS
 mbv1tlNvVcdB01UG59iRMvNOCEdQQZU0gCri67.d0a7xgOuZAyjkHso1PIlK4mBkGWyVbAv9AxCn
 C8gXEaF3tS9AcEVPiUV7D0idIQTPPUY_OUEQfJNva_fPT9E_vTPr1xpPH6xHNeTChXveKKhnVAx5
 7JyYiOJdPxCh2yyHoOTKWG6gZ9umNkp9uloDeOjVd0upC5jQ.zEKOgh_eycHhxklaHChzohs2fpV
 8bTKaLOtaJkomh3WLkl0I6OT3sdM8qYaFn.z_E7kD0CcC2hJqo6CTX8HFjhGgJHlA1iqoz6n8Tgv
 0mdPGcJVjWPOKkMfOb4j.C8d1NxR4NInrw_nXxFBeo7wmNxQ_FKu9olGjEAhz5R0beS33kmlf_ZZ
 dZn_dEUIK.25oUqdNRKHNuxzfZd5FrohvoKaTa7MN2tWDJLsgwiqsqKI-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Thu, 10 Sep 2020 09:26:21 +0000
Date: Thu, 10 Sep 2020 09:26:20 +0000 (UTC)
From: Franca Rose <rosefranca198@yahoo.com>
Message-ID: <359207387.588439.1599729980664@mail.yahoo.com>
Subject: Hi,
MIME-Version: 1.0
References: <359207387.588439.1599729980664.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.1)
 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36
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
Reply-To: rosefranca32@yahoo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



Hi,

i am trying to reach you hope this message get to
you.from franca

thanks,
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
