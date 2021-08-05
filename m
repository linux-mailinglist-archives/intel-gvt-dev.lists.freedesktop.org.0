Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A728B3E11F5
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Aug 2021 12:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B189A83;
	Thu,  5 Aug 2021 10:06:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD989A88
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Aug 2021 10:06:35 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id w17so8109940ybl.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Aug 2021 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=IXiF0cE8iLdsKXBHXuqgd6kWlwigyuOCyyGf/zSHAKo=;
 b=gVRICvgNVgrQ3cJyQMwTU0g/wTlVu51qYspoR9eYhaaxpyJpM6ZXNDbrq8iU5sNOAw
 WCNcZj5wj8T+nFqESzzWGRlrla2k/I3JWSMYTLrjL1hpiD1z9GF3PGwJCk7mXUdbyBav
 lwX1JOcUQoCno7ldIGljfep94wMuKVOSTdewlx7F7mOmxLPDSS6S2snzzzAFXm1DSXof
 RoPVdXCKfw1cNqZrc5tlx5mFbmoWjSxbJGPLTmSjyegFAixheRQuNqHe6bsXyw76zwZ6
 PXjm8MdDepD5gPfPScHBxJrmAZ/qTiyjDo0ptVk42bRwbYu8iToSty/dfI9CQu/RZ5IP
 NIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=IXiF0cE8iLdsKXBHXuqgd6kWlwigyuOCyyGf/zSHAKo=;
 b=n+kRzGsDn2ItCQzHzSABicVL7ceDg6FCSCoZu9mLV7VfrEnn9L1JOBGInu+oqsV4Cm
 mriqknO1JLdarv9a9CGoQARW3g9KIhjhaS7OJCeBUIyO6D2b/n8+yqW/I6aD0QhxU5uU
 pXJmHOj1+I96/IAluV/RsUy5C7uCOEaDlzuNi3sRr/6M87sh/aNkH56EE75/Yaw9ysl2
 y8tKFTlalD9GKsjr9V/rNBAzwjqmdwqphBen/27v56ndCp5iSt1bUx8mmrdHsWb3WkjJ
 oqCJQZL3cZdFtezwRzPp5ko4NxeYGeYhAWBfAu3fqlx+Ksgjy4AWCiVQq9g54P9Rky2l
 w7ig==
X-Gm-Message-State: AOAM533ffWXS+foJf3Hofbzi3HO6Rsbk+eLNBe7ofLXXQ028PV7I7dlI
 CnVURavPa4Zfl02J/NuXmlepI+qMnBI9dnIkWps=
X-Google-Smtp-Source: ABdhPJx+VQH0dDppGOgYikN+SwcT8tFSms9EM7r/kU/6MVigam8NL0DznwU4oB6xwW3gJM8xFfkLpcefYv/9NslpXa8=
X-Received: by 2002:a25:c2c3:: with SMTP id s186mr1803812ybf.401.1628157995126; 
 Thu, 05 Aug 2021 03:06:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:330b:b029:db:4f3a:6691 with HTTP; Thu, 5 Aug 2021
 03:06:34 -0700 (PDT)
From: Rihab Manyang <diamakaire48@gmail.com>
Date: Thu, 5 Aug 2021 11:06:34 +0100
Message-ID: <CAJq20Omah3dpE2ziJavGMsDNwAqbpU-LzxNZ6dz2+Hx3s2fjtQ@mail.gmail.com>
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
Reply-To: rihabmanyang07@yahoo.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 

Hello,

i am trying to reach you hope this message get to
you.from Rihab Manyang
