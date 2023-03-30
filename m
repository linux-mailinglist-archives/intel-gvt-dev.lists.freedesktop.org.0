Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7156D0219
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Mar 2023 12:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3E10E1ED;
	Thu, 30 Mar 2023 10:49:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA3910E1ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 10:49:58 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i6so22892126ybu.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680173397; x=1682765397;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3AzcMPGGAlGokQQc0+syzd1NbS1dbdd7PXTfrnTjUqY=;
 b=cCQotZJJgEWb+7pc8racqP+ExGW2k+HBrvdnbr8Gszag3mn2Aq4OvMUMp4LCAIFnAx
 KxUbKebsuXr03SRC0J0fEVbTU4xJnmARrcD3C2Wjg5Wn4mIPBkt+TDbDfGuHKzXR+mZM
 CzfKpAW9TXU7q4qqXT/FUYQDNJ+ooO+nAEOWVJCIOKu/vsxxAWLkBoi3C59zWtiMxRPN
 aIM9OLH6jLq+zxuBY/T1lVgbednUVgbITvBLJihpKayKx68Rrc9VKPShQfNS5whDnxiA
 hSKarJ9oT019VhtTEhPXlDUHLMFDjWhK2UZh3asAp02lF3e7stk4UibftRwjMt2sj54n
 UsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680173397; x=1682765397;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3AzcMPGGAlGokQQc0+syzd1NbS1dbdd7PXTfrnTjUqY=;
 b=2mCKVjzNhdZyNs0JI+6P/xbv6JQiunCg0HhZttQTXA352sAj9Jj+JduDgxlq3+LGi6
 Dpp9Kqi2jD4gNju8WanecnIGhkow1dcxHLgezS3FlPIAQRLfBLfjF4f7XsdNJNWEO0WN
 D9CvHVHP7N8vCgPqPK1R9poEjx2dj45PUAnIy7s/QAtUsMnVf+P0g1MF4utdnYivtK7o
 7a+d24SxPV4lzmizgfUz39Txh0keORfBEkHR918robzD6wOKeJIdw6j+whyhzFSA1QoB
 zDpYLLi36tVXXAgdpsLi4Edtp/M5uGIclpiXCkNFp++TlGYSd/cuKHpK911cGiaGhfPt
 VUAQ==
X-Gm-Message-State: AAQBX9fpFV1zAWsicQguxggYxDOWKsgdrA3s3MGZFo0SQcxTU+1Xt/F7
 7ylcyj0T/ZkeISltKNKip4axTbP8gK2fcN8pya0=
X-Google-Smtp-Source: AKy350ZsP1MNOSHiTtSZmVGtEAhQABwTJocqKh7ioBD7bKlNYVRDXyWb5o4GgU8GnGmdoabCDMuQHgkfQhppXwXzuyc=
X-Received: by 2002:a05:6902:70a:b0:b6e:361a:c86 with SMTP id
 k10-20020a056902070a00b00b6e361a0c86mr12431372ybt.3.1680173397159; Thu, 30
 Mar 2023 03:49:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:9b58:b0:490:aa5c:537c with HTTP; Thu, 30 Mar 2023
 03:49:56 -0700 (PDT)
From: Douglas Felix <dffelix575@gmail.com>
Date: Thu, 30 Mar 2023 10:49:56 +0000
Message-ID: <CAFtD3P3XS3E2pZrW92PAxQFUZ35x378xUyx0fodkJ=Pi27agCQ@mail.gmail.com>
Subject: =?UTF-8?B?5YaN5Lya?=
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Reply-To: felixglas37@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

LS0gDQrkuIrlkajmn5DkuKrml7blgJnlr4TkuobkuIDlsIHpgq7ku7bnu5nkvaDvvIzmnJ/mnJsN
CuaUtuWIsOS9oOeahOWbnuS/oe+8jOS9huS7pOaIkeaDiuiutueahOaYr+S9oOS7juadpeayoeac
iei0ueW/g+WbnuWkjeOAgg0K6K+356Gu6K6k5piv5ZCm5pS25YiwLi4NCg0K6IKD54S277yMDQrm
spnlk4jlsJTlubPlrokNCg==
