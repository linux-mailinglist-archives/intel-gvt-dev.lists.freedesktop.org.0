Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D3441496
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Nov 2021 09:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15889916;
	Mon,  1 Nov 2021 08:03:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAC389916
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Nov 2021 08:02:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h11so28130836ljk.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 01 Nov 2021 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=kTlPYaJ3qmdiuwil3bN4/5BGELxQxYaH2mDV2D/+NOc=;
 b=afk96XLZPNdq0XUQ+C+Sg/ozYAwaC3yaDksIj/6w1qfCAtpHcUBLhL7vVLQ2g6kyU8
 HuE8JkrDQw9Pe98zTGVBizjoC/CJ2gIf2SQfvUW4I2bBAgnGSkvoj21GNxy44xhgi8wa
 zFqdnoxEWlXQcHKmvAjcp9ZZENtgzq59rPy6DMYJA8ElDG6A/MSiYpBhtVSFjq7WeFZP
 cS6h1mcE593mSy7oo/5H2eZoBJu7VmxoLBdfXFmBSkynwummjWwhugkKOoxpGYUahMwe
 FMx1gVtUWQYu0DZ7PVYIUCO/5nTM47dFNeeCKaLcfD+PjrFqLHGMy32UvVj5G8XqzaCt
 nFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=kTlPYaJ3qmdiuwil3bN4/5BGELxQxYaH2mDV2D/+NOc=;
 b=vNIqBlDPO9FZP/KQCRDFVXwslqhNCLm7Ta2NHVona74RypSCXUU16pLDRsPjXFbeBG
 Sh3NTwWGnrTqfnl++iO5nOGjRoN5TwPOuw1Oh+d6ncfBw4221PSrKFpfL262J27NOT7D
 J9z8Rz0ymz/Ls0OZ4UIbI5NxAK0KOEaCDaXJDj0DVVaVGgAzI/O+N78LQHzf+fOZtc7N
 QYB0v6NlIrarLvZFbaysLgnOoxwxP+SUzlwLYuNzObJ/yejYrdAGr/OPGtPGPd5YkdD3
 jxXbkARcxTmCnpBhWlpwR2JSpZdcrgQmugBvB1milq6SnoM0BpV3kRmZ9LLVLGcp3wGm
 MW5A==
X-Gm-Message-State: AOAM5303patMMBsyOks4Z2cm0TMn2+ffC/iYOFlkEzK2P0lLnvvGqUxm
 2VRrjB/yMTow0gN98UcGNMwSJSNif5UmkBhc7PE=
X-Google-Smtp-Source: ABdhPJz7bell/PbLM6PCZG9oyOsUGoUjtisMZ1a9wMI9p2Dqg6vVVtPriD7UyogYfoQSpqejN5auU/4R+7TnSX8/I0Y=
X-Received: by 2002:a05:651c:893:: with SMTP id
 d19mr30628974ljq.236.1635753777571; 
 Mon, 01 Nov 2021 01:02:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:304b:0:0:0:0 with HTTP; Mon, 1 Nov 2021 01:02:57
 -0700 (PDT)
From: Aisha AG <rbx17058@gmail.com>
Date: Mon, 1 Nov 2021 00:02:57 -0800
Message-ID: <CA+KbyyfmtMHH304LH3vgL9OeVB3eEp+KwfJyCty=yC1JWDycfg@mail.gmail.com>
Subject: Hello Dear,
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
Reply-To: aisha.7d@yahoo.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Hello Dear,

I came across your e-mail contact prior to a private search while in
need of your assistance. I am Aisha Al-Qaddafi, the only biological
Daughter of Former President of Libya Col.Muammar Al-Qaddafi.
Am a Widow and a single Mother with three Children.

I have investment funds worth Twenty Seven Million Five Hundred
Thousand United State Dollar $27.500.000.00, and i need a trusted
investment Manager/Partner because of my current refugee status,
however, I am interested in you for investment project assistance in
your country, may be from there, we can build business relationship
in the nearest future.

I am willing to negotiate an investment/business profit sharing ratio
with you based on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply
urgently to enable me to provide you more information about the
investment funds.
Best Regards
Mrs Aisha Al-Qaddafi.
