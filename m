Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F857EB2B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Nov 2023 15:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7210E219;
	Tue, 14 Nov 2023 14:44:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584CE10E0D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Nov 2023 14:44:46 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3b4bdb89177so485387b6e.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Nov 2023 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699973085; x=1700577885; darn=lists.freedesktop.org;
 h=mime-version:date:subject:to:reply-to:message-id:from:sender:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LOQyBwwqmjwKmQrBPycLXVpRKVSUCEpr5oAFvK7Ot1M=;
 b=SjooPjPwllmpLgYRqJKdEZ7DhXgLGi1IcJQp25rs864A7leltGRJa58HTxUICnE0cZ
 LWk2QIq/CbDqrzGm8rAopseooNYybGKsfXh825vxbERQdULOI8c6Gdwb7oao6D0//v5q
 By57xig1fccPH2eyxOxX717wNYWqpdQ7kXP+x/T3ACJDyaa9/SdtAgwXEFO+PGUPDj21
 KjYgc0x+2auZXWnKoFO+ilJkCF3qTZ+TGR05zSiQRaRBhA1V5geZSSYwSs//CD1Fe2J5
 QRQrlTP+Ag+OaUrqb12uGqraUu16IZxpb4LFn39CpyOsucvE0oQ7VHeAAvKLEXe802IO
 ok2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699973085; x=1700577885;
 h=mime-version:date:subject:to:reply-to:message-id:from:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOQyBwwqmjwKmQrBPycLXVpRKVSUCEpr5oAFvK7Ot1M=;
 b=koP6csAo3cxQQ2MoWr6XsaniXwALttMoIAsmr84yW73ZQ6C4Bor7FPT9nDe6ZPvnUN
 OoYcUDHrx4EQKvPUf+5H907WAKI4AqIp8owPEl2HsgvE7fB4af6KliTejrec3w5wKi4k
 8hmmx/jmMThMTIPbSe5PjXQ31oHao4SBeAgxQfsjusDG5QjJCRgy/wYtR81Xknli25AK
 QkVbhUwFKOemQ8oZwVZFmkSLll6hulWvE1Y7ZKsJK2z0MUnXa86hm44tJRW8+r6K+2sc
 CO9rubk62VxnyLq3d+PmFnFqQMfA+4k5UxTkVzYDthZL0UFeXCWA2JhabSmodrDE8W5B
 p5pQ==
X-Gm-Message-State: AOJu0YwGlRtSRs8vx1UllC8mIhxDwLidRKBTHHb53eBB7r7NuoTqDWZp
 mBymhIIGagHPVmI6T4h6JSA7Sv/El78=
X-Google-Smtp-Source: AGHT+IFu/77d5hjE+BlgE3yQCt3n9in54bqMG/9mZxdapgCY98a8wzsNPEoQuu5RlxfgomgrU3O/Mw==
X-Received: by 2002:a05:6358:715:b0:16b:958e:6a1c with SMTP id
 e21-20020a056358071500b0016b958e6a1cmr2784566rwj.0.1699973084708; 
 Tue, 14 Nov 2023 06:44:44 -0800 (PST)
Received: from [198.135.52.44] ([198.135.52.44])
 by smtp.gmail.com with ESMTPSA id
 s24-20020ac87598000000b0041eadf108aasm2763877qtq.75.2023.11.14.06.44.43
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Nov 2023 06:44:44 -0800 (PST)
From: Peter Wilson <linapua78@gmail.com>
X-Google-Original-From: Peter Wilson <info@alrigga.com>
Message-ID: <1e5e04c97881829b9926222edb0287eb84537a461efeeb83207e5e744f5a25da@mx.google.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: :once again
Date: Tue, 14 Nov 2023 06:44:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Reply-To: mrmo754abc@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello intel-gvt-dev,

Are you Thinking of starting a new project or expanding your business? We can fund it. Terms and Conditions Apply.

Regards,
Peter Wilson
