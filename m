Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC947193F5
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Jun 2023 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446AE10E047;
	Thu,  1 Jun 2023 07:12:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1010E047
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  1 Jun 2023 07:12:57 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-3f6ac005824so4228901cf.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 01 Jun 2023 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685603575; x=1688195575;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4v1BOiLGVeTVQ/zzEeXD6EoH8PyXAYCz2yTVw2pkcI=;
 b=pjnFkhCO+Yqaxu7so86ZK6I25VFOzNL4z3zIAegVG5sh8MhwGcnjIwctwlSbR8+fTu
 6hOiL5FWEKz3/K+ccBitbfQEEM6v84uLlpmtbFe8QRzZjkqX2Z3zsMzQXbRON62YjTDT
 HLEUCTx1kyIIb9GkVG7l+iIKlO94YpYFYnHqzjHQB9b8nG3x/AcLPavqqSJZRcfm+KLT
 8F9pE7CKUXGJLtLfM2QWWMGTibkumZO6G/QqqRD2JcA3G8hiIztG7E3EIfIO23XnndYi
 rz/VIl7Qhg2fjmxYwjxYFcC5FrvvxLX4C4JQjSCPPItzt1jqc5KwopIfg1cLTley8Rb4
 A/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685603575; x=1688195575;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x4v1BOiLGVeTVQ/zzEeXD6EoH8PyXAYCz2yTVw2pkcI=;
 b=Tg0MZV1jy+oOGsPjmo4C1LnpnvR2AWuIw3zoVlCrz+opmT4/3fPQ1/fKz9LdNsS5cm
 qffSuk1FGdzKP+rSMa6VzURkuu8MU70VAHgTRA/TjU8RHf2CzjxnRMFKZfkYlrSDTOCB
 5XD3YfxlOjK06aG6sDNBNzd490VfmQeQZiMO8h9nesYX78UWJp8CsrTUMDGw/5tvxRFt
 05Pn9wgAQmwIqo/8Sygs7qhaGFbDrqgKZ5TSeHsLacbxeSGnM3DzxwjssQ2bwKinR5kM
 zTu3DiFTYAhz/OSotBqYzOYY4WMHe9RNflTwoQ9+DPAZkiJNyAjFL5b/JpUbxffON1M5
 1meg==
X-Gm-Message-State: AC+VfDzGCNO6oo1+tANor3yHQYZ6oO+Lj0ilgryxQ1rmrcmZ+Cp5O5uD
 pBOVe2tvzy7J2PrX4jg8TELHJ2Dxuig/Sx5hqoE=
X-Google-Smtp-Source: ACHHUZ7Dvg1U9PKzeteoULFLBM0AkCv5HJxodLlipdciyGi+Tvu8I2gRfxoNscLGL+ItF16CxbCe/sM+XVzRBrY1x5E=
X-Received: by 2002:a05:622a:1986:b0:3f3:942a:1221 with SMTP id
 u6-20020a05622a198600b003f3942a1221mr9261718qtc.66.1685603575525; Thu, 01 Jun
 2023 00:12:55 -0700 (PDT)
MIME-Version: 1.0
From: "Tahir R. Marazi" <ouedraogomoussa354@gmail.com>
Date: Thu, 1 Jun 2023 00:12:37 -0700
Message-ID: <CADns7nCh9OG0d_q5ONcMX9hh48sugkzh2YvLdzwqZKZ_QGYNwg@mail.gmail.com>
Subject: Attention
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000059f79505fd0c2a98"
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
Reply-To: tahirmarazi2011@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000059f79505fd0c2a98
Content-Type: text/plain; charset="UTF-8"

-- 
My friend



My name is Mr. Tahir Rahim Marazi, I am a Citizen from the Republic of
India, I live in Malaysia, I have a business transaction of $ 27.5 Million
Dollars in a bank here in Malaysia, the money belongs to one of our
customer Yong Lee  Jeon, a company owner in South Korea, who died in 2020
from Covid-19.



Since the death of our customer no one  has come to claim the fund, now the
company is trying to embezzle the fund as an unclaimed fund, please I want
you to step forward to claim the fund as the only  surviving  relative to
late, Mr. Yong Lee Jeon,  50% of the total amount will be for you why 50%
will be for me and I will provide you with all the necessary documents,
please contact me if you are interested for more information and I will
guide you how you will contact the company to release the fund to you.



I am waiting for your urgent reply as soon as possible.



Regard

Mr. Tahir R. Marazi

--00000000000059f79505fd0c2a98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><br></div><span class=3D"gmail_sign=
ature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>My friend</div><div><b=
r></div><div>=C2=A0</div><div><br></div><div>My name is Mr. Tahir Rahim Mar=
azi, I am a Citizen from the Republic of India, I live in Malaysia, I have =
a business transaction of $ 27.5 Million Dollars in a bank here in Malaysia=
, the money belongs to one of our customer Yong Lee=C2=A0 Jeon, a company o=
wner in South Korea, who died in 2020 from Covid-19.</div><div><br></div><d=
iv>=C2=A0</div><div><br></div><div>Since the death of our customer no one=
=C2=A0 has come to claim the fund, now the company is trying to embezzle th=
e fund as an unclaimed fund, please I want you to step forward to claim the=
 fund as the only=C2=A0 surviving=C2=A0 relative to late, Mr. Yong Lee Jeon=
,=C2=A0 50% of the total amount will be for you why 50% will be for me and =
I will provide you with all the necessary documents, please contact me if y=
ou are interested for more information and I will guide you how you will co=
ntact the company to release the fund to you.</div><div><br></div><div>=C2=
=A0</div><div><br></div><div>I am waiting for your urgent reply as soon as =
possible.</div><div><br></div><div>=C2=A0</div><div><br></div><div>Regard</=
div><div><br></div><div>Mr. Tahir R. Marazi</div></div></div></div>

--00000000000059f79505fd0c2a98--
