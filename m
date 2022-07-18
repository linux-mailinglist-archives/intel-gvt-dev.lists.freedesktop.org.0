Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09381578584
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jul 2022 16:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F1B8AAA2;
	Mon, 18 Jul 2022 14:34:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA148AA5F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 14:34:27 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b2so9188264plx.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uXwCn0jDYknAJ5LbLyTTNW7GLM9SiKp0MCZeY5zZWBk=;
 b=bAQzxIxZKj8fqfpYW3KaauozLtP8OKhndn2AC6R4Gg4T4NLWPMtyNH/FyLBrQArzSB
 wCURp9RV9q2k8l8VEMbnqDb2Wz1KgXLm1m6OBeEIYqSMs8LxSEiDgtUaVw5yfvWbSjYf
 qQ/GSaVUz2Nlksj6afvdbomcwoiN757N0X42gMG+kgfJo5mObk5Y4E/dEpMGPNvGD+sO
 cPUtSBCpm7UVUsD3G4YP5e7N/4Nz+lQkKF79RuhR7NFClLKNvnr+IedRcZW8sEznzDs3
 eoch5xNpCBsYV1Na9tzT1QuK4uG8YyYpfl8IdKrCSx5+NVr5q4wHytXyM9hZ7W52n8oG
 IBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=uXwCn0jDYknAJ5LbLyTTNW7GLM9SiKp0MCZeY5zZWBk=;
 b=IaO8G0nySqKAtKFSHhhzxrsKuRBrUGBt4jdEO1vPygLUOy6/GIcprd28YQHp6hegVB
 3Mx4/BUle/ded56R06CasgUBw/MrWxQtRb0rY93wowy391AIlpvGm1GmjH8gjyTmNCoh
 NL0xt5fximeQB+59G/LCJZamnfpiscuHZeuzJrOQyFwkXg+W8V1UddQJ4yMbbZaodcKE
 kIM9ZQs2K5JrE9GrBjSAPDwsTdbQA72ipEAlNI3k9GbugDpRHsWSVMFF9KnxIEWf+lBc
 hs4OH3kqt56CzdqIRvI1ZeeSQ21r3oeWkMVLP0nSLsxsyJSxwMvaKn1dnu+cy7f2PHzB
 3EgQ==
X-Gm-Message-State: AJIora8bXlixN8jolTvOOnzGkMT4wQX8BNIQxOTivSqhRQCEfoHaZdcM
 MyHTtmMvltyKmZB4UUe0830gpl3Pvo09saV9zTk=
X-Google-Smtp-Source: AGRyM1sUBz6s3yCO2zcwpRiEEjJe206/hPM0ds+LF5voRV5oFd0N9UHB+XDDcvXtmKcD1TXYfI7xIpWmEkQbMoux13g=
X-Received: by 2002:a17:90b:1bc1:b0:1f0:3830:8c99 with SMTP id
 oa1-20020a17090b1bc100b001f038308c99mr39763680pjb.1.1658154866727; Mon, 18
 Jul 2022 07:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:491:b0:42:57c1:97d9 with HTTP; Mon, 18 Jul 2022
 07:34:26 -0700 (PDT)
From: Stefano Pessina <ibrahimadham27@gmail.com>
Date: Mon, 18 Jul 2022 07:34:26 -0700
Message-ID: <CAOz10GdmDJg=_7r=Oxf1i8tm=iawyAQuySyFheijzyK018EjwA@mail.gmail.com>
Subject: Re
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: stefanopessina466@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=20
The sum of =E2=82=AC2,200,000.00 Euro has been donated to you by Mr Stefano
Pessina Kindly get back for more info via stefanopessina466@gmail.com
If you are interested
