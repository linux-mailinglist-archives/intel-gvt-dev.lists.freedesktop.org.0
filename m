Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE06457DED
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 20 Nov 2021 13:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A806E43F;
	Sat, 20 Nov 2021 12:32:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A096E43F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Nov 2021 12:32:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i5so23145436wrb.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Nov 2021 04:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=w2dLnl5hsLVKZTBAdcVFnDnMtM7+guW1LU+8LG4nir0=;
 b=cQ4sa0RLmxPwPFn1iQHtDPNnu3wxt85tlCuJmDnpCjgmGMxx8i/oateruVYQAvti5I
 A5qE92dvGm+x1YP+CbK5Tq5OhtXE6vNimcHv6le77OfesyWmtCYZNXHE5+IG0f8L2bT0
 Lci51QRfH33/4FHSDCeiE4klj7YMLnup6Z9AxKwmd8q2vBCk3OtwmaYj1bSnn6G8m6GQ
 mxOZ3RS8pA3iEAA55aU8/EBq9h3Po0DLytgYovDVsFfbT36OHdQaUGwPLJ3lG01hFOha
 WpkBpT9gzq2iO8UbGhiS6xFhyGI26B7QXEWnQJX1hxeVH8W2rTVUYcpRy/W1U7h8dL8Y
 peJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=w2dLnl5hsLVKZTBAdcVFnDnMtM7+guW1LU+8LG4nir0=;
 b=aos7GaY1IEKLBWl0oTr0e1ohBhT5qUr1o76TasxO02Bg9sW3Ii0cK4k4sdo+NkvQ7w
 k2Ka9oACbA+dw8mp0KCASHiDzPhquRXcU0jLRS6cn3ap8ZB5FYugF/pUbJAdHyaZIukt
 RxCo/58IvoQywWBOIpw3YWQ4B7umYAuHzxPPtFLFU9keB9IdcEPcz0Ttmqh8vfjNjemW
 ATJuNDBKwatd1wNPZEGHlQjaHN+bYfmLLoi99vqw7/qBbB6x5S51wuYB0pYh5wC/MT1Y
 j8hwT7u74BhS6dr0ZwCR8flqWTaK6od9dcLT4KxgdQDs8a71DG2O/nFSEq4g5ty0nwU/
 uD6Q==
X-Gm-Message-State: AOAM532Una+WTIgtPZBAMQfiEpDcEIyH0aaqTLptApEPYmC7FDpASnKN
 SF5sqMaJ0YkYLpxVYgNlwQokJ8AdWGnHAtdOtJs=
X-Google-Smtp-Source: ABdhPJx6LRHkcC/2nzZUXHHyWAv8qwOLcVanyMaZO5SAGCaEWZSePdj6KgMnXbsAIfz8H/8CWMAmDV2d6TwcaPqmMOI=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr18155356wrx.315.1637411552709; 
 Sat, 20 Nov 2021 04:32:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:f989:0:0:0:0:0 with HTTP; Sat, 20 Nov 2021 04:32:32
 -0800 (PST)
From: Mitchell Vivian <duplanmartine36@gmail.com>
Date: Sat, 20 Nov 2021 12:32:32 +0000
Message-ID: <CAO-XXH5BAMnqsibuyWBB1vSqWFvEU_Fm4N1zBDf2pLptoHQP0A@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: mitchellvivian01@gamil.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello

My name is Miss Vivian Mitchell. I want to donate my fund $ 4.5
million USD to you on a charity name to help the poor People.

As soon as I read from you I will give you more details on how to
achieve this goal and get this fund transferred into your bank
account.

Thanks have a nice day,
Miss.vivian
