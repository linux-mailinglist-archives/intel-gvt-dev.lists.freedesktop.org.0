Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7624D955
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Aug 2020 18:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED556E184;
	Fri, 21 Aug 2020 16:03:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic313-13.consmr.mail.bf2.yahoo.com
 (sonic313-13.consmr.mail.bf2.yahoo.com [74.6.133.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F996E184
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Aug 2020 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598025831; bh=bhP3m3Nzm4za+oifvFn2m78jbkbzt4MKZ4SOzgutTBE=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=AaQ0yWjDgSYBsMVW0aMtX2qU7lx98XfXM8ZYos3JE4QaULKaxcMJXRgYawyZ25Sd9bDsSVAvGRPTnWkC2DTqSkFufspIxNkjcd66nZ7Sp336AWJtwF/c2cwyxzd+lPgmSr3+RmAmwPzDl2yJV6r5TTe6Vp79z7YoAjSCtj1+ajArjtEd9IfkRheOBNckwVMDaA1hkjPaTEiczyADX1A8g5kkf0uYQfGOJUn7t5zb293utz3v4Fc9oD3f62318j3XAu5ekxTOXIdvL2HYgDm6mEGzCdj2NRI5v2whzRj8eZy+uBxR7sQx7U/SVyKFKyuIEXvlF5wpPo+FLhSh3SELGg==
X-YMail-OSG: yxA7TbQVM1m6ExdAh8J.uMzAyOnCFmdK3WgjcD7djhEsaQQ71R_570pezRt9yJM
 NpXCgDz7ei72R6TFTnYpqCFmL.YfnUC7VO3AEsVG1zuEX_B3oayHQhWLPdVZ56d59YJpXwQnqKAV
 QgCjRlN4AAJ6Tv1iV7k5pH1edaMqkYAWdVC7ZlObjDmWxgioexSwnjaIuJyhe314WCddkoArJE1Z
 QC_gqBV5tr.eaVtseRxuScEWViIP7nyL25iCOOco3loy4YONfO6m4EuxpLVlLgGrbpVu4owYwjcL
 5PQ5srNPSZAqICgUfHfe1yImLcuOGj6jneEWZrTwzqMpaq0.Um9O3QT9SEWNOu_1ILd.N7Ub4t5X
 xk.I7kxR.EV.sA69nbVHnTJg60_0W8Jt.5uSG27nG6Bk8AtJxBnZcHzVKtD0mVbhHCejdsIAuKXw
 F9QsvBgu8Tf_yT8ii79iiOnCN5EhmyfQB65x0hbvfNGU9dGImbebTFhQDcENDrL43IUeA71CH_iV
 LhRVuwmIVV1VWUUWI3NRRuKvxXLEmTVTBGVUYABgXNDyg8f8xylTe37uivpoHLUmcrZgHNyP3IT6
 1A2D4rRQl.uWKkl4MwfN3ju0424E58FfuKDEwC_P41.eaX_Iu8frnBzXn_fX8AG9S6ti5LwA6I.R
 28gnPK2qVp7uFbcW1DSpWqAj5ePHvSPCJWUIq9JuN43vKeLVssLdiKSd0jrBfQIn2nHMmb2p1ui3
 WwEm.gL8mK_cgZPtZl5j5zo_PGtPPlarOW8aBzSPhqEC5dNVsCkUceePsmeDlkC6FUuqxt4PifMl
 cySarstr7jJBSabpUaYmpDEATatz.rw3Rz_ghLoj4M6ghevwhUSd3kGwu5ZhQUGYm9X8GbFivhnN
 K08NptgFO._YDs2iFnRrHyeM8lcn0oQIxNly9YCRAlWKYv6r6o8RmGzB2gi2GMy_cWuhEM7wgMde
 E_lP2lFLvdKJPUUhONK7UISssbhXxWiRqDnjhfefNl7yiQRMCrkWnXH7w8DlbxpICFEZ9M_B5so9
 eZT4NbTrBlJFXnfcQpRxf7umlPWayDRvZ6zvcuXuypvqFlzN3ytnKuDE9hGHvR.iywh59z2maB06
 Is.r_1sNX_CTc.lc.h9UICZ732MHSvjyY5PkZylr.gLXgcPO9HvPobzl73qJ_ju5xDOOzdElNxcA
 Q4r2DSDc.U9TzEcs116MiI7VZhK1JyHhE6M0IE6zRBtb1zp5v7KYyLW1kWXWQcBzincHg5ibb_Ah
 95pDa2TGDqdchzR0EOoagyj.K2CKmn6XvhA3CHMrNbjhxKiPdMFYFDTliEENkRLVdTlVdNPp0rR4
 VoXT7JYfbeqWj1TGSftAb5gBLdHvXU_TdLkqujWBlJzYUz3ucHHhWlMavFetPYv3KmO2VWk4YCkd
 D.1n9q5VkmIplsqGbzsDTWgJBCEeYz8ZnUO43.22H895.UGvIGsSX4plUKOnhzuQM
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.bf2.yahoo.com with HTTP; Fri, 21 Aug 2020 16:03:51 +0000
Date: Fri, 21 Aug 2020 16:03:50 +0000 (UTC)
From: =?UTF-8?Q?Val=C3=A9rie_Bell?= <bell.val@hotmail.com>
Message-ID: <1116819443.4172476.1598025830969@mail.yahoo.com>
Subject: Salut
MIME-Version: 1.0
References: <1116819443.4172476.1598025830969.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 6.1;
 WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.0
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
Reply-To: =?UTF-8?Q?Val=C3=A9rie_Bell?= <bell-va@hotmail.com>
Content-Type: multipart/mixed; boundary="===============1648189107=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1648189107==
Content-Type: multipart/alternative; 
	boundary="----=_Part_4172475_650968825.1598025830968"

------=_Part_4172475_650968825.1598025830968
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable





D=C3=A9sol=C3=A9e pour cette approche inattendue, je suis Val=C3=A9rie qui =
d=C3=A9sire votre amiti=C3=A9 sinc=C3=A8re si cela ne vous a d=C3=A9range p=
as, je reste =C3=A0 l =C3=A9coute

Sinc=C3=A8res Salutations
Val=C3=A9rie Bell
------=_Part_4172475_650968825.1598025830968
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp8d491721yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div><br></div><div><br></div><div class=3D"ydp8d491721signature"><=
br><br>D=C3=A9sol=C3=A9e pour cette approche inattendue, je suis Val=C3=A9r=
ie qui d=C3=A9sire votre amiti=C3=A9 sinc=C3=A8re si cela ne vous a d=C3=A9=
range pas, je reste =C3=A0 l =C3=A9coute<br><br>Sinc=C3=A8res Salutations<b=
r>Val=C3=A9rie Bell</div></div></div></body></html>
------=_Part_4172475_650968825.1598025830968--

--===============1648189107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1648189107==--
