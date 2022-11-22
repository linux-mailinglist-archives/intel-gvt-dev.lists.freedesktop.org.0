Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2274633973
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Nov 2022 11:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C594010E3C9;
	Tue, 22 Nov 2022 10:12:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3110E1CC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Nov 2022 10:12:05 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso16788765fac.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Nov 2022 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0NmX+s+7N74CaFsfH6eHi+R9DKuqXYVbgTBMQuOAyQ=;
 b=VmJti7fW2RwQbvXHTTPl3P3BtBP4c7uw1/uF+kM+c+1kwdVBrXyAEv0vNw1dHRlfJD
 sNPp+sbIoc6CNuwncO/VDB8YEs6ZhsBTXTr/SuCnbOeoJUbpCrPvruSYsBxNfWkQniuV
 uyV271coiURV3KyeLBaYxhWY9h9a+MwczFCTlgYthv3GvOdn+8GiGN8tKvb06hUihFmL
 /Bx6gcc+pwABJdEkpPj/rplKmmryWvM1Bekq4NV3szNHxVXZ0cBT/dLIrR1+DJAni63G
 z6uBthk266THCSuegLJqypQZD51Vw/QPqUQ0Pjz+c/jdaGLwlcXrFBypnWqo9xkCwrsb
 75gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i0NmX+s+7N74CaFsfH6eHi+R9DKuqXYVbgTBMQuOAyQ=;
 b=c+mQdsY4lHJ0Uqu920gHU+FLnSElsU1BZw/QHb9xM6XkAtvTohHal0Eqi8X9db+Gy9
 /QFFcKQTjQvV74rQlp2afUx8ew8hNQGoMcjIR1p3M0C/YkEMLvpxJS+f3z3xZV/FmooK
 WIsafBQLokd7b4Xo+5SIpcGgj6+UcJT8ffRULwfINbhLkOXlS/fcIIhnQUutSMzLdJIG
 TYJywffs6IMn6HHWq6sKlkwF8H3I77EqvN4+my9DvCHWy2GtvuxxctMzRcsAKom1Ka3V
 YfnJIPcMx4vTRKAynfIR8cHwd3J3G72xQHXqNqlw0Ad593BRV0Zzjq/KV6fZfwbfmOdA
 gaTQ==
X-Gm-Message-State: ANoB5pkfkZXxN4AD1JpYgnIK/9ANLOwMOfWFKoPljhMWtvtl2sY47DGe
 YkFUmIS2nCN0bpCanrUsZP+/xmAUWuhIFHBxi+k=
X-Google-Smtp-Source: AA0mqf5dW97QbL9evaCwg0UPnaAAtIsj8+XgZhnp0an/fzBymB6eUkWps6dZyMgOVjHqg17PhiFNT/HC7FJpfgbHTmw=
X-Received: by 2002:a17:90b:1282:b0:214:1804:d96b with SMTP id
 fw2-20020a17090b128200b002141804d96bmr24320439pjb.90.1669111451623; Tue, 22
 Nov 2022 02:04:11 -0800 (PST)
MIME-Version: 1.0
From: "Lucill.T.Bickley" <idahohellen5@gmail.com>
Date: Tue, 22 Nov 2022 10:03:56 +0000
Message-ID: <CAEKsotKzRL_7-ygT+zZuLnc6BkTtdyZ7N14+3UiS+KQxx2wfTg@mail.gmail.com>
Subject: HI
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002a27dd05ee0c4b3f"
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
Reply-To: bickleylucillt@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000002a27dd05ee0c4b3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To the family.

Good morning My Beloved in the Lord.
I am Mrs. Lucille.T.Bickley.

A (Citizen of the United States of America),
an elderly
widow who suffers from a prolonged illness (cancer).
I am currently admitted to a private hospital,
I have funds I
inherited from my late loving husband,
Mr. Bickley Smith.
which he
deposited in a bank before his death through covid-19,
and I need a very honest and God-fearing family
that can use these funds for the work of God and 30% of the total
funds will be for their compensation for doing this work of God in
charity orphanage home project in your country.
Please,if your Family will be able to use these funds for the Lord=E2=80=99=
s
work, respond kindly for more details.


Your Sister in the Lord.

Lucille.T.Bickley.

--0000000000002a27dd05ee0c4b3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To the family.<br><br>Good morning My Beloved in the Lord.=
<br>I am Mrs. Lucille.T.Bickley.<br><br>A (Citizen of the United States of =
America),<br>an elderly<br>widow who suffers from a prolonged illness (canc=
er).<br>I am currently admitted to a private hospital,<br>I have funds I<br=
>inherited from my late loving husband,<br>Mr. Bickley Smith.<br>which he<b=
r>deposited in a bank before his death through covid-19,<br>and I need a ve=
ry honest and God-fearing family<br>that can use these funds for the work o=
f God and 30% of the total<br>funds will be for their compensation for doin=
g this work of God in<br>charity orphanage home project in your country.<br=
>Please,if your Family will be able to use these funds for the Lord=E2=80=
=99s<br>work, respond kindly for more details.<br><br><br>Your Sister in th=
e Lord.<br><br>Lucille.T.Bickley.</div>

--0000000000002a27dd05ee0c4b3f--
