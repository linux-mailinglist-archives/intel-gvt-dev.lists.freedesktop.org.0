Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253A6074AA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Oct 2022 12:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB6D10E390;
	Fri, 21 Oct 2022 10:09:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D3410E066
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Oct 2022 10:09:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a13so4008294edj.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Oct 2022 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Odi55I3gzrJ8le1wxaUBj3K8WFShwmvkI0Y2iQzmF44=;
 b=XS90RYrc40DCQW7+7RcOKUt+8PSXpQifC0PmVVBHbysTW6jByyNaRig2q4T1KAfcog
 RYN8x33aIXGn/Coy+Vi2HgKeckw6wVCC5OrqsUaZRLK8OCJZH38/SbzKbpMoUELxFieS
 wEropaMdK4OV0jRroeUI9vH1yT/iLmYxIsh7RGXng2p+niHvTGE6gAi/2w5LQ85umE/s
 yocnN6Jq3MGvtxJTo3R4OpjI4h9Nh735EmFGgXo80KhwKyVNUMf7BwMveLZE7VPCMico
 CSd9t/sCBWpAS8FucHiZ9I1oZKQmL0BsQTJL1448qVEXxYweQPIIad51BTwVPRTp4eJy
 Nt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Odi55I3gzrJ8le1wxaUBj3K8WFShwmvkI0Y2iQzmF44=;
 b=Pi9DXt1D3abWuK5Mvyp8IDXdDQIxtOSvhUfpsr8Mbi1g7eg16OMOvVH4gTfusRzTD4
 J/EsiQDtV9sibjPRms1rLo9jApg2mcSGcvCKPebMVzwcPcTX2cfbCcJhrERtgTaqQlUf
 GbBs7dho5NXVlRQsI4ASnGvXF1Xt8vmUghgT7nNom25MdGxXSv7GSNTyoH49HJ5/v6Rr
 izf4wlGAVFSMLzKgsDO9M/Q29vX9d1Jhlw/bNh4ZUZqx/LIPVV7vOy7SeDBNDWUn/cVn
 wS3OFuhkOtRCFbqfd6AFlyKj99xV1zwRq0YBfoYIDtwkZm9vUGd1KSrKI8aTKm002hIS
 1Vyw==
X-Gm-Message-State: ACrzQf2XEVgnPZlw/wdXhl2Z8tkf5QSjI1zr8s5gHqdYs5WOi0DE7QVt
 Uj/MUiWI0s3Xw93MSR2Y0yJv1nxKcSkr9CDFQfLfCZboYnBM
X-Google-Smtp-Source: AMsMyM7ckAisPEW2CcgG8a42aH0Ey4DbuWlGPeQdPLQXV9JFc6sXWelvSh8vqFJf9IT4aCzkQeLILhEwSZQWnXN+Udw=
X-Received: by 2002:a05:6402:5252:b0:45d:d1a:fe7d with SMTP id
 t18-20020a056402525200b0045d0d1afe7dmr16566504edd.323.1666346944939; Fri, 21
 Oct 2022 03:09:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:c245:b0:78d:9843:31e4 with HTTP; Fri, 21 Oct 2022
 03:09:04 -0700 (PDT)
From: muftan mosoh <muftanmosohhhh1@gmail.com>
Date: Fri, 21 Oct 2022 03:09:04 -0700
Message-ID: <CAEajo2ThNk9iqY7hPB6M-BT8DNF0GWOfk2mEKq2jW8dJ+fzBWQ@mail.gmail.com>
Subject: Greetings
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Friend,

I came across your e-mail contact prior a private search while in need
of your assistance. My name is Aisha  Al-Gaddafi a single Mother and a
Widow with three Children. I am the only biological Daughter of late
Libyan President (Late Colonel Muammar Gaddafi).

I have investment funds worth Twenty Seven Million Five Hundred
Thousand United State Dollar ($27.500.000.00 ) and i need a trusted
investment Manager/Partner because of my current refugee status,
however, I am interested in you for investment project assistance in
your country, may be from there, we can build business relationship in
the nearest future.

I am willing to negotiate investment/business profit sharing ratio
with you base on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply
urgent to enable me provide you more information about the investment
funds.

Your Urgent Reply Will Be Appreciated. contact me at this email
address (aishaelgaddafi294@yahoo.com) for further discussion.

Best Regards
Mrs Aisha Al-Gaddafi
