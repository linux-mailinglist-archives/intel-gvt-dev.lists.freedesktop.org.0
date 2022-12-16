Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17764EB35
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Dec 2022 13:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172810E115;
	Fri, 16 Dec 2022 12:08:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B3B10E115
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Dec 2022 12:08:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h7so2283719wrs.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Dec 2022 04:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kxYdS7HXFgPwD0CbUOPTSoYIdNu/3BBiNK57EJjVBfg=;
 b=nw24oilNvBLsUwxMtA/zlLlnHu4RAjOhbuAl/KkY/v7HLBsemi1P/8nfdEGrZ3g8nt
 NqfX9+N6K3Rd/MDJa+hCSvRIBLhmqYSwqIn9HCxb0ceevKPiszPnR5ZCjakhbfJRszoe
 ZyLr1/f/qxJEK1HOWeFENTS4cWnVaMDB2tXElL0KKp1sKpUqf2QhQTJnTCMggSU3ZqCc
 KqQwnanJ8OslSUBfC16JUWcGiVz+YAzBiQciDQWkDr7amBDYw6yq8TY6iN9PB3IGGpOr
 BxWqpb2xezjZz3Mve2Qmgl48IlGAmOAvWG3ypEwj7wuERI0NV5PA8GtZVGAzUlbkDPb9
 a9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kxYdS7HXFgPwD0CbUOPTSoYIdNu/3BBiNK57EJjVBfg=;
 b=zixaivUiMKs2xKk4TTCA0pNAX+B5OkYLuXRpZdKcVyWtDbwmXr6HdM/409GpHK33Bw
 jmwyGV1EF0ulNpVmFhgiby8ohU5klL4JliL3kDf9TSaRFJqckiBJcvdSbPqWamvxJSO4
 KuBvZXMdY+c1o5MdzOX9iTmnENrmVTUum/kNMFpfPvj+ba1rMIXkQbB/rqU6fHg7yoDc
 t5hKWDO83GK2O9JHtv5pjVGMuxJkwS/WW16WP2tYS/ybXwSvk01qbeJuUZnXBq305Jhp
 AIN+B7bjIe9i5HF9pEUkBcjFmSmEkXUrH0V2zkbjddYJ5FxchK921bW4o3lj1+EDTvLi
 U6rQ==
X-Gm-Message-State: ANoB5pkNM1mz5EHEHB3W/QOfxqW8abHwbq+ZeRUAgbwR1PohhfpgPLuc
 ETxhnVq5FyUES5wg7Z7d7+wZeoBB8OVHDzr2gv0=
X-Google-Smtp-Source: AA0mqf5cKH9DbZNl1pSxkxtZ5J0HIcftwG1E/j+J/505h3X0QV7SeI8lxq+G9g401JxmrWVjhu5ypo9CD2yEtaU4EiQ=
X-Received: by 2002:a5d:5a95:0:b0:250:90fa:3e3 with SMTP id
 bp21-20020a5d5a95000000b0025090fa03e3mr1018150wrb.653.1671192493993; Fri, 16
 Dec 2022 04:08:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:fa0a:0:0:0:0:0 with HTTP; Fri, 16 Dec 2022 04:08:13
 -0800 (PST)
From: MS NADAGE LASSOU <info.anitakossi@gmail.com>
Date: Fri, 16 Dec 2022 13:08:13 +0100
Message-ID: <CAJFTDKR_igGuyEGXdfJ2rjwVwuNa51p30ZgWsjYAAKwNRAVFZQ@mail.gmail.com>
Subject: REPLY TO HAVE DETAILS.
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
Reply-To: ab8111977@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Greetings.

I am Ms Nadage Lassou,I have important discussIon with you for your
benefit and others.
Thanks for your time and =C2=A0Attention.
Regards.
Ms Nadage Lassou
