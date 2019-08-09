Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88AB87821
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Aug 2019 13:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730B86ED79;
	Fri,  9 Aug 2019 11:03:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B96ED79
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Aug 2019 11:03:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b17so69233514lff.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 09 Aug 2019 04:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tBmCJJXq7jXWF51HQT83WT8GWj0eP8aRmtnAE4+75cY=;
 b=NRz4NAzU647dPU3TOe2FO2d30XTPlvf9ZktSFt7W+2h80NxwrBJJ6ZSvRg3xcRXY6d
 VeQEzIoZZqglCtczeFEUgqJtmjnAA1i5n7CI4aNOaqijTwulg8LbVr62sW1UxZUeMyMp
 i77ZSr7RR0bC33wefRjqm3FnRFvl++OTp0p6u7dssLofHY9J1RH9w3VtO1LaIyr5TeDa
 yTdUruqWDGUs+2Lhw0ujFypPem/CzMwBWEX+PLdSdeVxtO93yaYzPXSK2R7FuIc/etAw
 doWHnbRf/QrJjM8zbunHbMTy5JGMuxAFdzpBuqTxh+8GYOk/pV4uGt9oDv/xoDsz4itr
 QBLQ==
X-Gm-Message-State: APjAAAVlTWC6IxXCoE8GITViDNzy3MoMP6KrC1ZGrTUKLtcNng4CvXfd
 DIfmQhigWN3+Gjb+LyEAoQEyTf4IDGsLWV5yx/vOaA==
X-Google-Smtp-Source: APXvYqxtPQh+nwSS1jASJIrzt6wJmXvBy0WaiXp8jVzPd5wEc3pcIVpv0LMEHB3Uk11BfyVjDc0Fb2ecvDW6YC0HWLg=
X-Received: by 2002:ac2:43d0:: with SMTP id u16mr5779597lfl.38.1565348630490; 
 Fri, 09 Aug 2019 04:03:50 -0700 (PDT)
MIME-Version: 1.0
From: wenjian zhang <wenjian.zhang@gmail.com>
Date: Fri, 9 Aug 2019 19:03:38 +0800
Message-ID: <CADvkpQLsSu5_JZ2sJQyD458VGavS3_z_NkFMxF-7bO=iL_3wTw@mail.gmail.com>
Subject: Re: Local Display Direct Flip Feature Discussion
To: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tBmCJJXq7jXWF51HQT83WT8GWj0eP8aRmtnAE4+75cY=;
 b=Tsce7lBqo+saDGsZ6SHlkj6jpKZNmmhbe94FJ5IKODh8OV42SVqqvMN8syyNPoCFRF
 FoZoTHR3XAGuMtVCAPm1wUUyC1PKx90akuHN4zDZe3gLE0mhMePOm+2UDOeVfImzZAvx
 STcfJzXcM51IyTveoEJO8jQIf9YJqE/UfLx1ro3rODqQyyeNu6X9Tk33z7UD30iEa2vR
 9wYAvFz/+I4tBgGiZnVQHdJHduTYzZBycy0cldn0mpJYKFqe1hKgy8tQIT67eSoWtX/r
 RFf2YmebF9AQsz6qXTqEfRXhedeANqsrqke4rOLBLcytPO5ftG9cQPNyTtnwosGW29jA
 bqLQ==
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0393081100=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0393081100==
Content-Type: multipart/alternative; boundary="00000000000011f04c058fad215f"

--00000000000011f04c058fad215f
Content-Type: text/plain; charset="UTF-8"

Is this feature already available in latest kernel and qemu?

--00000000000011f04c058fad215f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this feature already available in latest kernel and qem=
u?=C2=A0</div>

--00000000000011f04c058fad215f--

--===============0393081100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0393081100==--
