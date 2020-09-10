Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC2A263BB6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 06:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE6E897F3;
	Thu, 10 Sep 2020 04:05:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546A89FAD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 04:05:30 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q5so4773349qkc.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 09 Sep 2020 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=OElLJZk8btajbvpuSG/8L4wCzWXpdvQQnLBCfzHgw/M=;
 b=CVY70xjSyMd4msM9WxAQCOxI3lCD+9zMNBx6Pavu6tBDiM2IbER6SqXPyPpb21MwIQ
 Dn/ipBac7uQFGHlVrJ7cgr2SmaMR0hET6GQaUk1RKqEokRmhVS+mzgG2dBKeSQ5Pu67H
 NOA3/x0E7wLCmzALIYuC/1f4s37SjWNABPnCDFhik6ca8o4kR+WaTzY67BayreRyxpz7
 QUVQI26ZeNLUlaNGF0C9kFQxNWB/2UsDBqmiBiFhQGqXfhYn9S/08lIOB3RVZKAEeaFQ
 UZmbiHT4SGX0ypzJXK7glWRQ1fMmGSvoKdAsuB320DnwQb7BV0KxzVphzk1xIu4oaVHK
 ZuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=OElLJZk8btajbvpuSG/8L4wCzWXpdvQQnLBCfzHgw/M=;
 b=Z6MVD1nHb72KuddKCRfy/TftIFI9IxKmRn/A7oMxcaWxxW2BwVn4zz//W6y6MMg3Vc
 qGH5uW7XfTM/W9uG4/TP/N12hxLiuE/ic53T0qNIbIerBpadX7rf0/tnUxsaKZ08e+Tj
 3gZ50dR/WGXUPdPPa6olr/ng+4Xh2v4ColJgZGSYG3gXqEmK7yBUKfsGwaXeEMDVNwQ3
 9rcxnfdlDpuI4fXDa9ROAXJGxFxcBtGeOrqh7sIyaI1kojFsgIYSdmnDQJgSH/ce9nma
 QJyCAFANzMrSgZlRPcQUWnViR1H4077EyfWModNVhPv5jOjVTI11Od6SJLTp1Fy7M5wz
 xw4w==
X-Gm-Message-State: AOAM5329LRj9B9BHGi4xWLWS57KH4m0bvukKzRp67Q4o+4nZ3XPQBZPj
 m++FU/SW5cDV2D6Oraa/Ci+jrkinIrAerU3YzXI=
X-Google-Smtp-Source: ABdhPJxukMszx9H7ATM6LF1cD+zALg0VXeJy0Dp4culAM1OQw9xRnNGs1Nf7FxIMyQ59B8CGaocssy27GxiVyt9FkC0=
X-Received: by 2002:a37:6481:: with SMTP id y123mr6155785qkb.464.1599710730060; 
 Wed, 09 Sep 2020 21:05:30 -0700 (PDT)
MIME-Version: 1.0
From: Fatima Rajab <fatimarajaba766@gmail.com>
Date: Thu, 10 Sep 2020 05:05:18 +0100
Message-ID: <CAGqfsL8iF2wd7io-UjeUUD5eH52LSTh=dCWZ-qVTUO-N9FTZEA@mail.gmail.com>
Subject: HI
To: undisclosed-recipients:;
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
Reply-To: fatimarajaba766@gmail.com
Content-Type: multipart/mixed; boundary="===============0141848262=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0141848262==
Content-Type: multipart/alternative; boundary="000000000000cf08b805aeedad37"

--000000000000cf08b805aeedad37
Content-Type: text/plain; charset="UTF-8"

HI
Nice to meet you
My name is Miss Fatima
can we talk please

--000000000000cf08b805aeedad37
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">HI<br>Nice to meet you<br>My name is Miss Fatima<br>can we talk please<br></div>

--000000000000cf08b805aeedad37--

--===============0141848262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0141848262==--
