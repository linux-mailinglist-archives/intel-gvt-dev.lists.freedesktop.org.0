Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1771F83FA
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 Jun 2020 17:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0356E43C;
	Sat, 13 Jun 2020 15:41:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic308-18.consmr.mail.ir2.yahoo.com
 (sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84A56E43C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 Jun 2020 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1592062887; bh=EdQ6J0sRRv3XBxt3j7IlulUVvRg4uKdicik//r5GkY8=;
 h=Date:From:To:Subject:References:From:Subject;
 b=h5YjncCAY47nflZp+ux0t1Z7oYkYc/seTfJe0L+40ePhhyYjh+2D/zmtsQvEgUJFSab+AHpAsqVur5e+QnN9OS+0SZInOsWdP1r8ye9uxGfQbYvgTzS8hdeeDRVjWGI8hroCaLV7R0VdLZlrwq42EJrrrzKmYk4j1u3rg3dbPf0p1asOXuCC8n1GfGi2KpLmzJzkvzfeN2UJywiC5/pZ7oALPeeWsV8kz0tTsG8AVKf+QjsL3tpaCdeAzZ8vXG1f8QQDFweWc0fw9NDLpPfssGk4c7Ti0nU2OVrVkmBAe2Sdaiz8Cm0XynpA5bi1Lg/TsMosna/yH3awA0SkcJUNrQ==
X-YMail-OSG: 229BmzUVM1lUFmDHSj0GBixFDnlzQfK.c7I8FkiRfnhfLsBXx.BtIWWYcby.3Z0
 LM.M8auJxWVqkJuKagYBc7WA7EbJmLDiWUve413pt3Li2qrHjKhMuf1RdsYOLZB5SUVaKTfhkUX_
 8TqWtNK2V406JK9o2JyKwiL9uPHqHdjKe7GUoPd.jK3ZJKKv72WWralY2ISKQlcupDgDLbdCRHzH
 EEc.OcB0yhRkw2ZWUz41UeBqotuM7Y1vof16gTP3NREEO74y1WQq682e0ose_tt.A0iBofrrAy_V
 emX5WCy84188_6pvOQsI7I7n4AflH9ua9YpuW3xhlNl6u_P2We38OSUdxPQqLXEjCTv65tE31N4a
 eTJ8yzgRFQvGUXP6PGalKnF2Mt0lYBKLByMSsOBahS2V0rBFWhr4ZCZa.gq0VdEQuAaHmy.LYNQo
 ZF59PxyGf0lsfSoTMVxjuM.IdrGzPxsBAYgBZ_BMMFCNyPyDUBBu_bZVb3Ur04CRuQApHdWo_lOO
 k6nH2Rv3iVd8xAb2l4BMQJSRsYzfa0fnyNxwqHNk9cMYQ653bZU7gSKBYBbDRSlijWX9UvMAgfV.
 vHEHfk1NvKfk3Bdhk9KIOLji3y7W7Z3clJgqk2Zui66j6WzGt1yKwAmaVBcG20OyBtEc0lJ265Pn
 uwJYekoFgSa7r7sB36qbJ_63YayHRdj864Ql99Vr5gYD71s6vZDU7ntP9wo8uD7WAhKLQt6xGVGj
 oYoxvFybooh1Xc1uby.GTViJIBM09pErGRgOo95ZYDEd2xjHgGP.ufj7sRWo7Y89__XbBa2N31Ow
 ql_PRr1kKITDGTH4OAawIjm1pmoaCqP2hM5c2rFfRrsjthLOlbWRuWKb.1ZYIxnduzM8_tOlsREW
 GU.iojZZweEahTmc6YkAP77fgInCJx7DQcExy43Oyaiac02qyKfA7eRq7_9K.b4a0IgYrTqdMa8S
 VDBrBpxnpaneeyYkkesY2FuDJ.qZTKusgeHeMdjt8jfB2VJNUcs_8Ydq5nBR5opOrJ2nGy0O2RDC
 sdCknPQw_hZQSbJgjFyEgrKq8d5EPHN0MBQrBhJbLKXvRvC1lK3iVw8SjlLfN0anOmWdO4wIaKdp
 Szp5_4MRI_o.UewFWXMiKg.y9qSFNhvtPGD91paMJ3lgybolJKGJYG0ZiDf366lOXBkPiUu30Fe5
 3ctqoEvUpEEHzp6M79_gWcgXnDfCOEsPbfcLi1jneDTuV4bzApWr6zXoi5OUSJK3pmQdzDeA_FlB
 cwG9pT.prpQaEEZXoHgWMamWdKOMmOWi858grnhVq9tI2G3hIY6ZIVV5dC6U-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sat, 13 Jun 2020 15:41:27 +0000
Date: Sat, 13 Jun 2020 15:41:22 +0000 (UTC)
From: Rose Gomo <rose_gomoo101@yahoo.com>
To: rose_gomoo101@yahoo.com
Message-ID: <438389059.456207.1592062882893@mail.yahoo.com>
Subject: Dear Good Friend.
MIME-Version: 1.0
References: <438389059.456207.1592062882893.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16119 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RGVhciBHb29kIEZyaWVuZC4KClBsZWFzZSBjYW4geW91IGhlbHAgbWUgdG8gcmVjZWl2ZSB0aGUg
ZnVuZCBJIGluaGVyaXRlZCBmcm9tIG15IGZhdGhlciB0byB5b3VyIGFjY291bnQgaW4geW91ciBj
b3VudHJ5IGZvciBidXNpbmVzcyBpbnZlc3RtZW50PyBSaWdodCBub3cgdGhlIGZ1bmQgaXMgaW4g
dGhlIGJhbmsgaGVyZSB3aGVyZSBteSBmYXRoZXIgZGVwb3NpdGVkIGl0IGJlZm9yZSBoZSBkaWVk
IGFuZCB0aGUgYW1vdW50IGlzIOKCrDIuNW1pbGxpb24gRXVyb3MgKFR3byBNaWxsaW9uIEZpdmUg
SHVuZHJlZCBUaG91c2FuZCBFdXJvcykKClBsZWFzZSBpZiB5b3UgYXJlIGludGVyZXN0ZWQgeW91
IGNhbiBjb250YWN0IG1lIGFzIHNvb24gYXMgcG9zc2libGUgZm9yIG1vcmUgZGV0YWlscy4KCkJl
c3QgcmVnYXJkcwpSb3NlIEdvbW8uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
