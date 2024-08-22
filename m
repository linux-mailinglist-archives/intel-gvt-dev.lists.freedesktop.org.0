Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7995B861
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Aug 2024 16:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F83410EAE5;
	Thu, 22 Aug 2024 14:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=iardu.com header.i=@iardu.com header.b="GIzafBU7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 12581 seconds by postgrey-1.36 at gabe;
 Thu, 22 Aug 2024 14:29:45 UTC
Received: from mail.iardu.com (mail.iardu.com [157.7.87.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A470110EAE5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Aug 2024 14:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.iardu.com 3A91BF4AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iardu.com;
 s=default; t=1724320809;
 bh=HljGcuCtEbUgLL612nTRMmFmkSRXUnTe8LpYc+B+Aa0=;
 h=From:To:Subject:Date:From;
 b=GIzafBU7wRyDC9rLQhyymyuJl7s1sYSmpDWNIF8+cKpzPY4klolK/nwJ8GlGRIDt2
 M0miIJHjRMfjJJGoNRbZ2W4nnjZmFpE0id5G906Y/N2YyencltcIjPHFT50il1O+Al
 mnj1yyRF922rtnmmzcsp658v0Id39WAJUUG5XzPM=
Received: from xryi.net (unknown [149.28.22.131])
 by mail.iardu.com (Postfix) with ESMTPA id 3A91BF4AE8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Aug 2024 19:00:09 +0900 (JST)
Message-ID: <ddabfd91a2312c52a36175cb1d5e79aa@iardu.com>
From: no-reply <work@iardu.com>
To: intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?44CQ44Oh44Or44Kr44Oq44CR44Oh44Or44Kr4oGh44Oq44Gu?=
 =?utf-8?B?44Ki44Kr44Km44Oz44OI44Gv5LiN4oGk5q2j5Yip55So44Gu5Y+v4oGk?=
 =?utf-8?B?6IO95oCn44GM4oGk44GC44KL44Gf44KB?=
Date: Thu, 22 Aug 2024 19:00:08 +0900
X-Priority: 3
X-Mailer: Krut Ypgfqh 6.3
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_001_NextPart358743565957_=----"
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

This is a multi-part message in MIME format.

------=_001_NextPart358743565957_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=E3=81=84=E3=81=A4=E3=82=82=E3=83=A1=E3=83=AB=E3=82=AB=E2=81=A4=E3=83=AA=E3=
=82=92=E2=81=A1=E3=81=94=E5=88=A9=E7=94=A8=E2=81=A1=E3=81=84=E3=81=9F=E3=81=
=A0=E3=81=8D=E3=81=82=E3=82=8A=E3=81=8C=E2=81=A4=E3=81=A8=E3=81=86=EF=B8=89=
=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=E3=81=93=
=E3=81=A1=E2=81=A4=E3=82=89=E3=81=AF=E3=80=81=EF=B8=89=E3=81=8A=E5=AE=A2=E6=
=A7=98=E3=81=AB=E2=81=A4=E3=83=A1=E3=83=AB=E3=82=AB=E3=83=AA=E3=81=AE=E5=88=
=A9=E2=81=A1=E7=94=A8=E5=88=B6=E9=99=90=E3=82=92=E3=81=8A=E2=81=A4=E7=9F=A5=
=E3=82=89=E3=81=9B=EF=B8=89=E3=81=99=E3=82=8B=E3=83=A1=E3=83=83=E3=82=BB=E3=
=83=BC=E3=82=B8=E3=81=A7=EF=B8=89=E3=81=99=E3=80=82=0D=0A=0D=0A=E3=83=A1=E3=
=83=AB=E3=82=AB=E3=83=AA=E3=81=AE=E3=82=A2=E3=82=AB=EF=B8=89=E3=82=A6=E3=83=
=B3=E3=83=88=E3=81=AF=E4=B8=8D=E6=AD=A3=E5=88=A9=E7=94=A8=E3=81=AE=EF=B8=89=
=E5=8F=AF=E8=83=BD=E6=80=A7=E3=81=8C=E3=81=82=E3=82=8B=E3=81=9F=E3=82=81=E3=
=80=81=E5=88=A9=E2=81=A4=E7=94=A8=E3=82=92=E5=88=B6=E9=99=90=E3=81=97=E3=81=
=A6=E3=81=8A=E2=81=A4=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=E2=96=
=A0=E3=81=8A=E5=95=8F=E3=81=84=E5=90=88=E3=82=8F=E3=81=9B=E3=81=8F=EF=B8=89=
=E3=81=A0=E3=81=95=E3=81=84=EF=B8=89=E3=80=82=0D=0Ahttps://mercari.qnetmobi=
le.com/?mD5vG8Ls2=3DFmLXYz4&token=3D3Mb7rETRPtw8r73zWMNR=0D=0A=0D=0A-------=
=E2=81=A4----=EF=B8=89--=EF=B8=89----------=EF=B8=89----=E2=81=A1------=0D=
=0A=E2=96=BC=E6=9C=AC=E3=83=A1=E3=83=BC=E3=83=AB=EF=B8=89=E3=81=AB=E3=81=A4=
=E2=81=A1=E3=81=84=E3=81=A6=0D=0A=E2=80=BB=E6=9C=AC=E3=83=A1=E3=83=BC=E3=83=
=AB=E3=82=A2=E2=81=A1=E3=83=89=E3=83=AC=E2=81=A4=E3=82=B9=E3=81=AF=E9=80=81=
=E4=BF=A1=EF=B8=89=E5=B0=82=E7=94=A8=E3=81=AE=E3=81=9F=E3=82=81=E2=81=A1=E3=
=80=81=E3=81=94=E8=BF=94=E4=BF=A1=E3=81=84=E2=81=A4=E3=81=9F=E3=81=A0=E3=81=
=8D=E3=81=BE=E3=81=97=E3=81=A6=E3=82=82=E3=81=8A=EF=B8=89=E7=AD=94=E3=81=88=
=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=9B=E3=82=93=E2=81=A4=E3=80=82=0D=0A=0D=0A=
=E2=96=BC=E9=80=81=E4=BF=A1=E2=81=A1=E8=80=85=E3=81=AB=E9=96=A2=E3=81=99=E3=
=82=8B=E6=83=85=E5=A0=B1=0D=0A=E6=A0=AA=E5=BC=8F=E4=BC=9A=E2=81=A4=E7=A4=BE=
=E3=83=A1=E3=83=AB=E3=82=AB=E3=83=AA=0D=0A=E3=80=92106-611=EF=B8=898=0D=0A=
=E6=9D=B1=E4=BA=AC=E2=81=A1=E9=83=BD=E6=B8=AF=E5=8C=BA=E5=85=AD=E6=9C=AC=E6=
=9C=A86-1=E2=81=A10-1=E5=85=AD=E6=9C=AC=E6=9C=A8=E3=83=92=E3=83=AB=E2=81=A4=
=E3=82=BA=E6=A3=AE=E3=82=BF=E3=83=AF=E2=81=A1=E3=83=BC=0D=0Ahttps://mercari=
.qnetmobile.com/?mD5vG8Ls2=3Du5TnjY1C9r7rB66e
------=_001_NextPart358743565957_=----
Content-Type: text/html;
	name="Attachment.html"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="Attachment.html"

TWVyY2FyaQ==
------=_001_NextPart358743565957_=------

