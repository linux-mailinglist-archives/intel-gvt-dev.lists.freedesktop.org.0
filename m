Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B5801B0E
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  2 Dec 2023 07:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06510E074;
	Sat,  2 Dec 2023 06:53:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E1F10E074
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  2 Dec 2023 06:53:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bc57d81f4so4199955e87.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 01 Dec 2023 22:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701500011; x=1702104811; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pApf8BRo0qzMGd3tEmcwLp7QLwb5eYnp8zdNsrP81Ig=;
 b=Sy9SyHtDtZ0tG1PnprxFb7elVeyXDU8VBkg25tFAuEWFzLqyLyAE/TfEk7pfUK+x7M
 oxjcObo9MJB7qu3CTgTLSDCkF+5HWI51OOt5wzSgJlRDBO9LI5T+N6SwemJjzwo8Z/IX
 JiU35oDVRbXjHj8pW7vJpbIs8NNinEFkmXSWIfPLbkZqIBrQwG8D89ncTlgI+ftdQhRJ
 UJpU8tBQEx57GCkQlogkO9dF+Ru/8jNIobmLvMZoSWQD99nstgRSExkKMWKLCEuVUTvK
 /Q89qLopaNZAWDOlW4WDgIQnn6FrSlR1iGMEk/t7acXUq5rU98K86LbbLS0ajzKdPbyt
 lQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701500011; x=1702104811;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pApf8BRo0qzMGd3tEmcwLp7QLwb5eYnp8zdNsrP81Ig=;
 b=oEkWPmD3bWQsjWZaQCc2p3a3ti6ZCOKtYx4erIxkvTWlo9KC6kROCERaZ6TcIfFkRg
 p3eURYrfCOePRQeijap/E4YH9xdFcHaaCcgIUATExvRuaOUgKiOEGdrdFiuHlfu5UJF9
 tS+Zhj1Yn1N0HQHMkczvvsk/s6mpev5VIv/d8SHFPcVKUMFGkWzZ1DY/CXRA1odwI2Pe
 B8PuggheLOf8iCz3O/dowrtQPquwQjZlu/gSDxbOduigihYIDSxk4uU2J//NqdCNIapE
 8KiDgl9Nt8evTPiDYSiZCa4NA5VD5SmKLX7sSsjm9VXh97xX9FV8eHZ0f/fF+E6tqREg
 VCGg==
X-Gm-Message-State: AOJu0YxhwXV5R4s7sSw22x8i99f1O9YERedVLFS6QVJZgRTFmxbLK0ZZ
 u4nKo6+k4TvHQujhCMnNQrpQEe7HG0YNVYc3n/0=
X-Google-Smtp-Source: AGHT+IGZXzLAPj97VSLU0Ag56tSTAxPQtsa4dfKpkvrmQWFO0XApW7/ywl+XfYlrPb6J2sYKRgP01REfXcJQ5WBxB3U=
X-Received: by 2002:a05:6512:1096:b0:50b:caf0:fc06 with SMTP id
 j22-20020a056512109600b0050bcaf0fc06mr1307648lfg.9.1701500010941; Fri, 01 Dec
 2023 22:53:30 -0800 (PST)
MIME-Version: 1.0
From: bakayoko kone <bakayokokone779@gmail.com>
Date: Sat, 2 Dec 2023 07:53:19 +0100
Message-ID: <CAKA4WphBr2f_Wjyew508YDC=BB7pe_tX38qmhPXcq1pG9W0OPg@mail.gmail.com>
Subject: From Mr.Bakayoko kona
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000bcd245060b81575c"
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

--000000000000bcd245060b81575c
Content-Type: text/plain; charset="UTF-8"

Dear friend,
I have a transaction to discuss with you, a transaction of great importance
to the benefit of both of us, a total transaction of large funds.
Thanks
From Mr.Bakayoko kona

--000000000000bcd245060b81575c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:Roboto,&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif">Dear friend,</span><br style=3D"font-family:=
Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><span style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f">I have a transaction to discuss with you, a transaction of great importa=
nce to the benefit of both of us, a total transaction of large funds.</span=
><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial=
,sans-serif"><span style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,H=
elvetica,Arial,sans-serif">Thanks</span><br style=3D"font-family:Roboto,&qu=
ot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><span style=3D"font-fam=
ily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">From Mr.B=
akayoko kona=C2=A0</span><br></div>

--000000000000bcd245060b81575c--
