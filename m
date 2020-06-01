Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D381E9B03
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Jun 2020 02:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0F89E9E;
	Mon,  1 Jun 2020 00:34:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A4689E9E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Jun 2020 00:34:36 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m2so4691689otr.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 31 May 2020 17:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QPyFeV2cDELhd9dc6jn+njAi3ogL1W0LM6bYSp1zceI=;
 b=S52nluh+FGf6LHuvJmdCSkPi43jDSKv2PoJGprXUaixbtsLIRV/M0T+g+1pTxLRjw2
 Lig4dGelbP2Z62Lc5uHNo9wqxdHrx75m+U4rMyEAQ48GVZ5DmqOlWrr9uTmjt/sYKD8m
 ISvmHMyIcvVCEV77R6g7sooabktDUboIYIsKZ5YSGtIPimmIBxwp/Q3ydikSoS39HZH+
 PQ2HuZKIjcnEdFEDz0Mw98enCQCEXBRMLEtZDAlycQRKxdF0JAWhy7SHLRYFsspJJB6z
 ISTKAfnXHkuHZEX+Pc8e4mFWVdeeyaS8M+Rv7JazwtV92DRpPVrQWiYFv59BVkjZ/gqg
 DT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QPyFeV2cDELhd9dc6jn+njAi3ogL1W0LM6bYSp1zceI=;
 b=lVpcTqM/RpIWVfmlDnSEJabuAorE8+WiQLuzb3GmMyFQ3yxqZTitbAOy3wCz077ti0
 loDbUZUg5LZLQB4iy9V0srycEG1UxhfG7JeRREH3Ldrb5WoO8sEl25vLhgW3fvOxA0F6
 BjG7fJ57D/pAvAJrHnSM7avQ7Dl5H3LNFLBBOBU037FjSxZBE0zOuichJsUNQClOY+nl
 XuhZurNC7RS0Dgml5xpCeLcQ1FqbbW7jjlPrwJhtBJFDeIn8Pr93aUkaX0ErS07OiIIz
 Ga2tztJ1ht430UBj7MSPv6uH7pBlrPitRXTE7BlqbIq3P1u451QZKo2dSSEbVMF61a2R
 8xFg==
X-Gm-Message-State: AOAM531DXFtjtrzkWgZ2LPE3H0wGrklG4fTXoF3l+qPy1yeCwIlIVWrM
 Vcs9CY0Cg93c7sBsEEVjBnA0x1Fvth6HLJ+evVI=
X-Google-Smtp-Source: ABdhPJx6ras+mERKK1mekY4SUJ1kpeBKURXhapDK3fdNINgXVcWpME9KTFwk3UZsF2tDhUb8yeSZHu7gCOfl2PO3Cy4=
X-Received: by 2002:a9d:32b4:: with SMTP id u49mr14949509otb.304.1590971675594; 
 Sun, 31 May 2020 17:34:35 -0700 (PDT)
MIME-Version: 1.0
From: Marvella Kodji <marvellapatrick1@gmail.com>
Date: Mon, 1 Jun 2020 01:34:05 +0100
Message-ID: <CAF0CuhBr_a7+a5kZMGcJALC+o2mbQ6uUse7rgfn3_-Nrefj4xw@mail.gmail.com>
Subject: 
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
Content-Type: multipart/mixed; boundary="===============1632724626=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1632724626==
Content-Type: multipart/alternative; boundary="00000000000092540f05a6faf50d"

--00000000000092540f05a6faf50d
Content-Type: text/plain; charset="UTF-8"

How are you doing

--00000000000092540f05a6faf50d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br clear="all"><div><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><span>How are you doing</span></div></div></div></div>

--00000000000092540f05a6faf50d--

--===============1632724626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1632724626==--
