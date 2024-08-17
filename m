Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C095597F
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 17 Aug 2024 22:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB5B10E0E0;
	Sat, 17 Aug 2024 20:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedesktop.org;
	s=20240201; t=1723925474;
	bh=eg3TerVjbgwpqK/h/JiKatmGrbrKp2sYJofI1p+mN5Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=TUGArsjtiyFwQY7IjdjUNBK0g/NlxoRmBQLVgv28jxPpR+L+tD2HjdbSA64psuLbO
	 ihD9N8px+E2XZC3NFOQBIWP2eRxHEF+j0c+x0Y60Q9WVEDvU+ebwWKU5XbF7cxfph6
	 iCiXd1W4QI6uTI/D7lrpzVslthjQNM90T3r1AfaEGFo+xLl59aVsLIAcwJ8Zt1Imcp
	 98YVuSSGZMQTNIbdwtd4xwOpoa1crjgxd+Hou+TiGQuMPYudMbFkT53bDbCHIhMhE4
	 j5IoqJn5mMVN57Sv4iiFTfcpD1Pieteqh8uOKTd+PAvFAmoHk0f3qQPBSDcyi+ndvw
	 WOQq6k5xCI8VQ==
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from cwp.ccclub700.com (server.ccclub700.com [51.89.151.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6D810E0E0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 17 Aug 2024 20:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
 dkim=permerror (bad message/signature format)
Received: from [105.113.41.152] (unknown [105.113.41.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by cwp.ccclub700.com (Postfix) with ESMTPSA id ED7833EE1F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 17 Aug 2024 19:54:54 +0000 (UTC)
From: <PASTORINALICEABRAHAM@freedesktop.org>, cylamarver932@gmail.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: =?UTF-8?B?UmU6IEdSw5zDn0UgVk9NIEtBTFZBUklFTkJFUkc=?=
Date: 17 Aug 2024 12:54:53 -0700
Message-ID: <20240817125453.9A6A34BC4793F57A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: pastormrs.aliceabraham@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Mein g=C3=B6ttlicher Freund,

Gr=C3=BC=C3=9Fe vom Kalvarienberg an Sie und Ihre Familie aus den USA. Ich=
=20
hoffe, Sie und Ihre Familie waren heute bei guter Gesundheit.=20
Seien Sie dar=C3=BCber nicht =C3=BCberrascht, denn mein Kontakt mit Ihnen=
=20
ist g=C3=B6ttlich. So wie mein Geist es mir befohlen hat, h=C3=B6ren Sie,=
=20
ich habe nur noch wenige Wochen zu leben, da alle meine =C3=84rzte=20
best=C3=A4tigt haben, dass ich diese Krankheit nicht =C3=BCberleben werde.
=

Ich habe beschlossen, das gesamte Verm=C3=B6gen und die Investitionen=20
meines verstorbenen Mannes mit Ihrer freundlichen Unterst=C3=BCtzung=20
an mutterlose Babys und Witwen in Deutschland zu vererben, da wir=20
keine eigenen Kinder hatten, die sie erben k=C3=B6nnten. Mein=20
verstorbener Mann war ein sehr reicher Amerikaner, aber ich bin=20
deutscher Herkunft, daher wollte ich unser Verm=C3=B6gen nach=20
Deutschland oder irgendwo anders in Europa zur=C3=BCckbringen. Ich=20
hoffe, Sie k=C3=B6nnen mir helfen, etwa 26 Millionen Dollar dort in=20
ein Waisenhaus/Heim f=C3=BCr mutterlose Babys zu investieren und auch=20
den armen Witwen in der Umgebung zu helfen.

Wie Sie vielleicht wissen, erforderte dies eine dringende=20
Antwort. Bitte antworten Sie mir f=C3=BCr weitere Einzelheiten.

Pastorin Alice Abraham
