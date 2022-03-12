Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F44D6BCF
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 12 Mar 2022 03:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F2210E2F1;
	Sat, 12 Mar 2022 02:11:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B3C10E2F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 12 Mar 2022 02:11:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a8so22664688ejc.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Mar 2022 18:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=MdeMU8pFTGmF9W3nGOCb/2s2yYCMh1Ha5m8wT/HaB6Q=;
 b=CyhCmEFZ9I7nt88yemtFQmA8sD7KtuoBKnpcUXsuJf3SyLJkKm0z9yFsVPoWaR1Bs7
 IDhvu/blVUlFiRltfywb99Gt0xoaWecCkaqJdJ51RWGqw5rVY2n1xYHlZYsthXSYoref
 VtCHHsUZXEDeahrNY7KGy5DV3nlVQL0cOKtRDCRvgOA56bMeG57S1Sw7UHRUCuQ/lPdL
 wtZ9ncso2pzeNNuhfPDI8grhJbAmzoIFDT3HZiENHOCFLw2c1y3Ku+ckRe7CX2GXcByo
 HmuDe/UcH9Ps4URxuXHcecxThcsyeHYRC25a2jVHHjR35iQoDNu6MHLkvfGjLt3z5qkJ
 hiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MdeMU8pFTGmF9W3nGOCb/2s2yYCMh1Ha5m8wT/HaB6Q=;
 b=FaxD112/VRyxwtWSNFDgJfoPdtpH8eHaweYE1azNpPngU/zpzb11MOowuT4dchAxcs
 KJXXO6wuNQunThXJsKk7KbaE2VMtGl1riStQVtSzHQA1WYZe3BoJJauzgNvTrfItzRVA
 RMKLfPWIPqrrldsIpDKR3N6QEo7Q605wfC9wZce4yXLFjFORYkaoeK7e+NyUAgw8Tlxo
 2++S41E6L/sbG8pyAwBUBij+gLzJPeRyxKUlIaOOlUQEPLX5t72+iz5BnOlwzfq0mMrR
 wOohTs13KrHz+SExojYKYxoyv0TAdM3PaSgjCBrsUXJ9SqUqPsPweMOLOZxOqkR+qzFA
 r+cA==
X-Gm-Message-State: AOAM532k6x0gFOd7TNVRB41cqHLpfh1j2stifRiaqgfGi7wixZm1k4BY
 ISsZfvbsGQjS5DJShEKYIeV5AIQ9Lkq0dMt88Mg=
X-Google-Smtp-Source: ABdhPJxiwXcupTpT/CHLjuRsdKPz7czxbU1EoCgRthnDjB1ZrzmI95Zbj0kGarY9GbpaLkrecCSlOJAr10zptaKIHFw=
X-Received: by 2002:a17:907:7f06:b0:6d6:f8f7:2655 with SMTP id
 qf6-20020a1709077f0600b006d6f8f72655mr10762371ejc.658.1647051074176; Fri, 11
 Mar 2022 18:11:14 -0800 (PST)
MIME-Version: 1.0
From: centikaya kozanogul <kimbaranb481@gmail.com>
Date: Sat, 12 Mar 2022 02:10:54 +0000
Message-ID: <CAAwaE3i2fbv-OkfKQX67yWrXiniL2ai4vmp78GAYjCcke+h1Xg@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000034091505d9fbf664"
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

--00000000000034091505d9fbf664
Content-Type: text/plain; charset="UTF-8"

Hello Dear.

--00000000000034091505d9fbf664
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br clear="all"><div><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr">Hello Dear.<br></div></div></div></div>

--00000000000034091505d9fbf664--
