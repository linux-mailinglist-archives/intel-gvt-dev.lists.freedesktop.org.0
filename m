Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF7120D087
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Jun 2020 20:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF63B89F19;
	Mon, 29 Jun 2020 18:16:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A073D89F0A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Jun 2020 18:16:39 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u25so9697756lfm.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Jun 2020 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=XdfoRVGuOCD2JOxmLnJxyvoO2f5zjf1xh4i//8cGLHs=;
 b=Msg1bPbaN7kAk8xcFZNLbId+5weK4tNnM+RbxbnFv16ioa98BTDL+I6HLcnJ/LXo28
 /bqKbh5Amit3tXTweR6AsISXb0P3R+G4mNSAOzqXo48XCJvam05nZqSdcgn2Xtfva6/f
 33dA/+Z7oe/RkolH+PPEmJpVKF+VMPhXshWMuwvcjecf6DfYScwJzmJtjcTQTrPse1sZ
 ilUIU4pG/32zdFVD5ok/FdEur1WykaDB/qJ/dHw1UZmGnKcTRzcE09gqSgXiV0uUFdII
 QxZfbm2nXjAYwwowCGCnj4o/F2Ckz3fVW17MV0zjPbTFPp0Egt0YjXcFfEAe+hh++Lt2
 bx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=XdfoRVGuOCD2JOxmLnJxyvoO2f5zjf1xh4i//8cGLHs=;
 b=YschhteFk5V1bW2Zv8nX7whqXVyieyggigd3uBE8xlh5SfE7gNoz+aXo8OVbvKsFo/
 mGiW6HLWglgPkw66dbkI6o/u4EtxdEdcBXLXXqH6cGCxNSlZdlOdNeFcVjQhCUlBjF0j
 wRwJb4sc5tcElDMQx4dwzYw9qrek5h1AC1X5ldww43uV4o2LAojdXMpoDF4TqvY7fSbp
 Yjm7J3zi6xz6LEtOSt5120dzzrjK7+cC+RRud7n965VlVCrF0eFI4ElI1FhZrByr3sKz
 q9lv2baITNPTaTfUp/NXjoY4Nq73VUlSQ4thSV1eSIS96uIxwULrWyGHsdsroybFurGL
 k1Qg==
X-Gm-Message-State: AOAM532140Lnz+lvq1zEmISQWOynY8DKcrBc4WeAYl1yCuhpMDsqnOJb
 SMWbV/g/UllGB8ss5jJ4IZ4p3WGc9gnvox+pDZo=
X-Google-Smtp-Source: ABdhPJyzFyerk7HwkqLmrAIrYSk2nsEhVPN2Tu2Zgd7u6s2FFD+CFSh/Py9BRjfpIAPh5Do8DAatdk5Ud7uNPbrpz00=
X-Received: by 2002:a19:e61a:: with SMTP id d26mr4482010lfh.96.1593454597924; 
 Mon, 29 Jun 2020 11:16:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9188:0:0:0:0:0 with HTTP; Mon, 29 Jun 2020 11:16:37
 -0700 (PDT)
From: " Mrs. Victoria Alexander  " <mrsali683@gmail.com>
Date: Mon, 29 Jun 2020 11:16:37 -0700
Message-ID: <CAPOrGYfdAwV=-VqNWuOH4ZdUx_cEPxg3MuBfUBDTa7pkep0Z0g@mail.gmail.com>
Subject: Hello,
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
Reply-To: mrs.victoria.alexander2@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear friend,


I have a business container transaction what that some of( $13million dollars)

 I would like to discuss with you. If you are interested, please
contact my email

address (mrs.victoria.alexander2@gmail.com)

My WhatsApp number but only message (+19293737780)

Please do not reply if you are not ready
Thanks
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
