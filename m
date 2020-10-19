Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF70292AFB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 18:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA6C6EA0C;
	Mon, 19 Oct 2020 16:01:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.ne1.yahoo.com
 (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003506EA0B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1603123276; bh=bUVp2J16ssRvVQxhTttLG6chpZXUqwTwXC32qV9oQA0=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=gxxf9Qj8ivBxC2lAaM8Gv8yxYNOZdPlDa1CWruDoRHSatc7heOzRIAvcmq2KJZCgw2653LRotiGLaHOwq6QY28i329BrXXQUHmQ+NzSn/6wcFweJF5OIjHld961oRQN3/eOGfYYk0NifHjxQCPbPdM1Q8KxEZKJGcSmKoTl9B0PBQPCCvSQs3bN1tMVRg6YYt+rmh5Q2/4QrlAT3MYBPpW9vCYqbYHjtTvRb0c6vYGwbI+nS0czCFKAmdVkcYVua+bg9IpZpw4/A6jmPwzXTLwYkDsQx9sNseEgDAkIvKNZ/fmU5752NtIhT0aGIbYpeH0YucRtwU0nVXEHCyFmFiA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1603123276; bh=wt2TsEmKxwwNTbh0LvChBg1oPwLAF6/fvwmQ09eZKMB=;
 h=Date:From:Subject;
 b=LLcag76pWNnH8q1vFmBKoyX8j9M0W0uVYaH4qpaqbPy2ioTz2t1/tfrjcWu7lF174C89RWnin4rX27EELio8D1+QafND7iyTM/gTqRtdW0mFIwUhueupHxiGTAq/t+qK0foYXW78ztAhxO1ak42HPjftmLMvtqYoa6iGOI0oZLdZI0dD9kLKakhTWhVj0Drq90F6zFGNTZvSJPpDQSicUrXf30Wywf1Gmh6syogVTC0GBFIwT+gwbIp/vfE4a0q7eSSO8C90tsrKblUcctVxzpc3J48gS87zYNvZr/1OlP4r5OEC18OfnFS8uBdj4wYT2qFwRAGqPuaJ11SPf/ga1Q==
X-YMail-OSG: xRAnWDkVM1lDihXomFDNA18da0rpGKvi4XY5T6.UKWy5uns3QHn.9.2IaP6Y0Xz
 o8cCru0cKp6DgX1wjSdwbJ4HEFuDqJZNNvXhFKlT8yrOPZFDR6ZGRsiuNh4_1j41EjI5i4q5gXu_
 UhuqOuaicrfkflJr7x7kuARqGUv4Ws6YvSBOVlOD6dwUMQ34tV2_wFJMO0PzA92NE0uG82QWVLoJ
 JAy6y44do3i26SyCqAKFhFEgJ25poqerw3GddSLLcyLoT.GJXyII8BdNnWXQnaGyKSqQIi_2WRCl
 lYCi1zFEWVIeRXGrbbfwFPycXe2M2kKw.cNWbjxWJgSKbddpawKTd6YJExYtV5YmdgmWHbspbBA2
 7KSlDVdKfjPJULeynWs5ACazUa1oXKS4yTJ.Cy12bhSJicxPkV0b5iYYx2WARu932n7.74nl4p9z
 oO3MNJS9CTqSvLQkegF2.9oPfyXutM9H76A3dVhZ9biuFQYv3rbCJCFpNxyMhWU5F1DHnqNGOMK8
 w0Xp_GqJ3QpIc5SX66j.v30pup4pMLc3umub3OTUYQY7z6hQUWNdx.8BxlEVQFvFtJz_W3S7kvtS
 dbPVgeCz38gA2_IDtEBzDP20nBDEUcqpFe2tPS_RtMMI7q94GKXslv5bv0Gz3e0aMe7hCsIY5RxI
 Vn170wwQ3Im9Kyw5gBxVSx5UZlS7NWlpCQtVf1EfdIKLkC1jKAIiisOX8pvT4lH2l87Ic0ayvaQB
 QzztjpkTtH8PIIRT2j4z8OgkUolca0Oqz7eOs7l2cm_BuY04hqZGmkplWaXx8TXOUTIRhUznIglv
 qWaa5jmuK.tL35oMmEE0m.D5Q12GKl9QlCI.CcG8VRPA4JEQk.3Br.IhGXXnLzybS5P8MeKek9eN
 BYhzVOMB0dRWwQiHVwC34qacg5noYa5MpJYq3bw40WM3m0tRgkQ9G9WLOmufcirvjMKcpBJKXLaL
 0cTOfj9Gvdz_xobdDm45JiD3mut.vfXNgUC_p.SUI9M0tkzG.WMaYRbmuuQl_RNPVDNC0w8gs84N
 .7PUEWHbLCI6V7.PoNo7HmaTVo9oHRfr0GxS8IdSnVXLmp1pdjp9lIhypIl57bc8V5UcgJ7M9MZ3
 gluysxIGFJU0orommGVH3UbJsgn5JtxY9iyNFXqnS9XcJclkiVFPMvC4JoOfAazS2wwyPesb90vm
 jZISwn_.5Y1nVAVJuMaj19L8IoXKhymZDwXRA0cW9rVc1EecSSu8ah7rrNMJ40osAuEUf1KL94in
 RMNzYXRhMJgH2Qqxjz8gbjXNhR8erwXrHI2xkPeIq35jkv.GUTJJnLomc2lynZtfu_4CFLvWIsq_
 KdKyJKFd0HXiThvryktbzjyp0wLwJ0_1giQuCeb6i6OL_gbXFWEKbv12W9tfnrlfEtjPSfDNngPC
 RUhEvrOKMiDnByEEstT4R_fzq98z5jUXnamQFUUQeyLruf7YKFEs-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 19 Oct 2020 16:01:16 +0000
Date: Mon, 19 Oct 2020 16:01:11 +0000 (UTC)
From: Miss Nidal Aoussa <mesaie54@yahoo.com>
Message-ID: <979854556.1077068.1603123271646@mail.yahoo.com>
Subject: Urgent Email From Miss Nidal Aoussa.
MIME-Version: 1.0
References: <979854556.1077068.1603123271646.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16868 YMailNorrin Mozilla/5.0 (Windows NT 6.1;
 rv:81.0) Gecko/20100101 Firefox/81.0
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
Reply-To: Miss Nidal Aoussa <nidal.aoussa2020@gmail.com>
Content-Type: multipart/mixed; boundary="===============1306638285=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1306638285==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1077067_1312105771.1603123271645"

------=_Part_1077067_1312105771.1603123271645
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Hello Dear,

I am very sorry that my letter may come as a surprise to you since we have never met each other before. I am Miss Nidal Aoussa. I am the only daughter of Cheikh Ag Aoussa, the President of (HCUA) in Mali who was assasinated on the octobre 2016.

I have a business transaction which i solicit your help. It is all about a fund to be transferred in your country for urgent investment on important projects. I want you to guide me and invest this money in your country. Respond through my private emails addresses.

Miss Nidal Aoussa
Email: ( nidal.kong2020@gmail.com )
------=_Part_1077067_1312105771.1603123271645
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="ydp2abeb88ayahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div><div><br></div><div><br></div><div class="ydp2abeb88asignature">Hello Dear,<br><br>I am very sorry that my letter may come as a surprise to you since we have never met each other before. I am Miss Nidal Aoussa. I am the only daughter of Cheikh Ag Aoussa, the President of (HCUA) in Mali who was assasinated on the octobre 2016.<br><br>I have a business transaction which i solicit your help. It is all about a fund to be transferred in your country for urgent investment on important projects. I want you to guide me and invest this money in your country. Respond through my private emails addresses.<br><br>Miss Nidal Aoussa<br>Email: ( nidal.kong2020@gmail.com )</div></div></div></body></html>
------=_Part_1077067_1312105771.1603123271645--

--===============1306638285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1306638285==--
