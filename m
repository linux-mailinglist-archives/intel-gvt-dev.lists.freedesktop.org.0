Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1FA0539A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Jan 2025 08:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041D610E264;
	Wed,  8 Jan 2025 07:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="AfVil06z";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic321-55.consmr.mail.bf2.yahoo.com
 (sonic321-55.consmr.mail.bf2.yahoo.com [74.6.133.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753B610E273
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 Jan 2025 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1736319612; bh=i/QDK4GUl4R0j4wiZUiKDVt6tw1ih+u6+PL6t2Hmdrk=;
 h=Date:From:Subject:References:From:Subject:Reply-To;
 b=AfVil06zXQaaubPC2B5agL/qGnt8blzN1N7lK0sgKsyBFiL30TxJIDym3S9fDvmCNUUG/oeXlCt5XMiu0k0AY2phoHmof+kZUCEGLxQFoncmbDmZq8rLVCqPOOxWU8W7jJ0o4g3o/9ZoxSp4SaU/AiZpi9QrgF/HtCZZ234Kg7oxWqyXBhP2JN1N1kNcNy0fR2yu7NY/lnWOlAKErDGzypoOgaLu5mMyLr5H777WZMRy3cErbmKddUXSQXwPBImazOZbcgVK0hq52EAvGrjSaWgBkhbCaMqQLh7ga3J6shyt9bb9a7Gaxcqu/g47IxyqPfx4uQYpphIneqmrMlEceA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1736319612; bh=FnEAtn0KVe8M91+mk2azRnXX5X/Qj8uvg6ECVjU+1bI=;
 h=X-Sonic-MF:Date:From:Subject:From:Subject;
 b=Cy7vtWEAWvUMHYFuuwYI1iCSWroV9QsQAFwSSsusWDSA+8KNvH/htxwsaukwJ9WZfCOusD1t3TPZfAuflXfxOu/QAF9pF/Zk8SflwLnGd0w2QhJEhiuG7CzPAy8wxZ/M5IEeugcFdZoIqdqeTQ4lgpUBl7t1LxCKbCqgLgH4eQ6hdurKoBh1PomIAczZlBKWyfEfp0VhJZJ/yi99S0dvMVrl5MYLYd8v+O1kiGNL7k3BA701JHzYBfu4Z+z+0vGq8+mCJhwNeiXL4dZJNnySprn7aC6QsysETgXmkjGT2ktvbI+57zOEFJYo3lS3kALFXrbPOQgy6eubeY1i1js0PQ==
X-YMail-OSG: L1TKEZAVM1n9BwmEJXOsqR7soRKgjB_rkCOFnkeeTgBSzQ12K1WYHx1HXcJ9yo3
 FjgrwGddJKTfLNCTQRY4LLqtX8H7bCiM.Etgg2oqaLzYvPwoIYzYsm86BFFGXY9xMN05MwykdD_0
 m65_KPvBw6KrXbOF4M8jcpOBW_CFv0gw4_B8T8OvNuEftZ8cdTlCB_pt7CcueeEQyaroLa_iQobE
 M8GxgXVvvanBVnAEDozYmygJJ8789tA1Z6aBPcwXqOueEm9KU1YsUorF9CbLByEaLJIVTSNEnIcA
 L9LGyX5Dy4P9dmuz0dcLcmpZvctl2U.cB.ql51Tn.DVuSsQH.iffQ8naXej.j859.Za34Y3Nk0lC
 6sEYVDpufBfjshc_IrvtuhQnJ7q4kj0AuOKQ76zYqOjh4JyAT94kzJl3zj5yLamCbya7ZaHAlMyX
 fCWJtBCuaDpeENnhkILTkR_VM8Q8M9eqLlqwfTfki9MaRhKPgSnNARCoepYpgJZOyA05FbpMQfyx
 VH8wuSFkuDYOsOSLUgchYauFKKjw3PV7AhWbHG74e589I4K_2LL8h8W8g5d21jCDmHvvCs_SlIZL
 Ku3ARkIvMclOSOL9D2jtSKxL92MiIA5J7W9NdgWh.fkonftB06R0b3TOJ18xZrXXflFJRpod_i6x
 BeXKK3gjY9FTs2LNKovPD157vXTSbk35zeuJhlEJOR2tj0sHyifjZsn0.XtTgG5TwZyfe6__LBxH
 fkzvOfLTsBZl4EFb4eHy5bUIMoL_8xqBUSXVpYOnlh5.Hl6Tz_mHBmBe1c__LSdYsGjjcunZUZZN
 V5Xio9KZdE8Vr4Y1v35zJDc.bqznzonNiHm9vUFRlQkR.ZSXhf9Tv3xEf4YFImGUQiu4JwZ6zDHm
 bOye9GyIKJpI84fIlSkcxzbrdb8nwIQ2UNfjEpjq8KsGcVs4dOJRqWhcR8_dbR0T6hRa0EFK7J8U
 6uE0TnjBd3EraJ1xTDrzLJZ8af7K8pntfe0.yicHUFSBesH60AG1n2FdnAQNQv6KVwD9WCS0tha1
 bVilYaZQeIEmpZpoSE7y7vTs4rjZsYfZ4MWTgap3nFQn1Bwot57oGw88lWqHQOfgO40zTFXCTFo4
 PcoqXKRIGSAJS59eDg3Bup0IGvxiGAj8EBxeuRcNVq.4_bs4S3f3sfcqnmyTOnO5NCqQAq7oXuq5
 rI8jIEIoz4q3Ny23XnSPLK6radKryyPTnfZf9RaiF21lCRzvRGS2bHibUeUzndTAO6gGWW.RNcvz
 PEmS6DgudtVg8FXYoNF2T.vmeRYSaZk6e1C00.V69hg3kP7W0J6osZbVHZv_u_tXJqXvBinhA81T
 Ocf1blFb3ERAL0IKh3uQlfE_oc5FoapSQ_OE4RHqNEWKKPcqWtNsI0bc58pY.rfp8AahsrAMap8U
 81niN6MzUlt1SaiFkLAfCRjtVV3qduSiA5HPEj5jZMj60xW5_SW4aIlcqVI3XJECpaGvRCpyxfZ8
 hiEXm.FY8BeGm9UhFZ4K8pvtUJzE0L7Ebd6R2mu.n2ocgUgIEU5m0HekzrwsfthoBWdFXwO8VSOC
 q1fZGmyTV60GdefVFt_khRXrx8Xj9iXXeo5SV3GkqRoPVdzxv9GtKRt2CtBAHxGPla9mSbS50MSe
 Cia6I7Gi40xEjL.1tuthf_akE4pllqqqYOjChXu.y1KAzZ1m23hFe8zNuapFBP6Hp9nWifv4sMJo
 ecMKSyuXBjfVryVzuvXVaf58KeM5yASuJJVF7ffFFtTF8raYcsQve5eCeEiBIrGgaC34htNVX.ur
 A685Wapnbumjo8I9lxZW4Qsr_mkH50K8HLoXCxIDbnTFdu1rgY1UqORFe68TXtGYI7yWvgXAvyVW
 dUslFMCRDMdRQCdKSIIX3R2sC.pMd3tVFnCNtrqO5bj1JUDzGXQYGSPsEDLa0dZYPObfwzfdXrz.
 1x_x59M6.8uh1hUjKw4HEUTRCENhFgM8R8k2ome57i_qt8vaF7xdfL.6WqqCkD0tcjEvU7x6kV2x
 eR7u9Lr.7k9YZOw_0Q5ndd9h6LWDQlITs8m.iUXTyoFGZJczVFHFhhYjgkhRj0v98itbQYdNjIAm
 nIsHJ3evdOJ542RDlGGt8XCHCBDqIMZT47S0SOrAHl3IiNgYmPHB5yX4kw3XYThxBXmXQqX.ze1W
 0UYsL4OKvBuoD77sqIPPk3DdNeoI5O6wjqJit9c1Hs1nIYoY_L9RMSD3gBSRzHJr36GXZ9C54qWl
 cKP4acO0W4w0L4in_XBhO_6N90EzryEYqiM4I8XOZw4mz96FnPGlw2k.MmWyvZeqfm4wN8iPOZxD
 JfLXtgMIN72w-
X-Sonic-MF: <barrister_gbenson@yahoo.com>
X-Sonic-ID: 5fe2d2f0-3229-4686-ab5d-d01749228b52
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic321.consmr.mail.bf2.yahoo.com with HTTP; Wed, 8 Jan 2025 07:00:12 +0000
Date: Wed, 8 Jan 2025 06:58:11 +0000 (UTC)
From: "barrister_gbenson@yahoo.com" <barrister_gbenson@yahoo.com>
Message-ID: <1717898470.4029759.1736319491257@mail.yahoo.com>
Subject: HAPPY NEW YEAR
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_4029758_331357204.1736319491256"
References: <1717898470.4029759.1736319491257.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23040 YMailNorrin
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

------=_Part_4029758_331357204.1736319491256
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Attn: Sir/Madam,How are you and your family? This is a fund transfer busine=
ss proposal with a legitimate standard. These unclaimed deposits are attach=
ed to my portfolio at the UBA BANK with enabling conditions. I have contact=
ed you personally not as a matter of choice but of necessity. Therefore,=C2=
=A0 I am seeking your assistance to carry out this fund transfer legitimate=
ly for your country. I am intending to relocate to your country as an entre=
preneur, upon my retirement.=C2=A0 Your Percentage is negotiable. For more =
information, Send me your take at: mkwame010@gmail.com.Best Regards.Dr. Mik=
e Kwame.Head of Investment, UBA Plc.

------=_Part_4029758_331357204.1736319491256
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="yahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir="ltr" data-setdir="false"><div><div>Attn: Sir/Madam,</div><div>How are you and your family? This is a fund transfer business proposal with a legitimate standard. These unclaimed deposits are attached to my portfolio at the UBA BANK with enabling conditions. I have contacted you personally not as a matter of choice but of necessity. Therefore,&nbsp; I am seeking your assistance to carry out this fund transfer legitimately for your country. I am intending to relocate to your country as an entrepreneur, upon my retirement.&nbsp; Your Percentage is negotiable. For more information, Send me your take at: mkwame010@gmail.com.</div><div>Best Regards.</div><div>Dr. Mike Kwame.</div><div>Head of Investment, UBA Plc.</div></div><br></div></div></body></html>
------=_Part_4029758_331357204.1736319491256--
