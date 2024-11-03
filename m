Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F89BBEEC
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  4 Nov 2024 21:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D281610E4B7;
	Mon,  4 Nov 2024 20:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BeZQfDSP";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72AD10E4C5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Nov 2024 20:42:51 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3e5fcf464ecso3087120b6e.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 04 Nov 2024 12:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730752971; x=1731357771; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KZY6kPLtKgkR3gedXnHjgcpBBGaJ4Bf+ax/hbvx0Wp8=;
 b=BeZQfDSPt33rtSb9bveLqehhPhlC8tAP/fKJE6wlfvl4ZzDwhrun7T4qh3Y78e7VUo
 rmGFB3USn0Lu2+yuYZ21tv9meheJlrxfIaCMBCY/zm4nodJxKLNa2IuG9stpJl5mJqyJ
 MpUrVHzEvbz4wvEllKSUDVzNgJWy1egyr0RifU3xwANNFaZTUj235Jp1tIkScEp/BIqr
 pXGb6F2TOhzS5LVOf0uzjLS2BeF/z/70aiJi9kpGJYKHNXkROEhrdkY0lc7tYUlXv7S9
 WUkAiHuqu0EN+VyO8eMqlg+1wsrlyoRGGTVO9ev6GShW0S2H2pq9yzxjU44zT6EwEsBg
 EQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730752971; x=1731357771;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZY6kPLtKgkR3gedXnHjgcpBBGaJ4Bf+ax/hbvx0Wp8=;
 b=KvhE36hDTyflY/5mqVFP0cUeyXrk/zuHkoTfD8FscTv2vrJYIphZSnJqY2tvNYfF1o
 2L7a3CFNxgDTg/5H9/Gi+u9TS0mTfBV74niMKyB/zF6wm5JJLB7j88LQKwzNcK3Ymu74
 OuNksmBRFRk5T4sUD0SsqEU8ir+eWIQ8ZUqR/ZqdrXEoxKGyiX/meuyGMVK+nLJtLLS9
 cnQ2600QGXG3++BW5MvjexKp+D8FIYPVJHHCk5EA+q7RiQ3Fx6WJ2L4aeaUQhLqTb3Sz
 nr5u23w0G5r691PqhsezEa0MtMdG1+6zkTR5NyDFoXyW8tlWEGTBBc84QVuvxQySy3T+
 J1BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy4F9vX6f1029TBJPsUnQVm9I8bQvD7GCBExHdsNXo88aeJ+hhq9fN58oNDfePXSTcqPO2AkJ2pC6FCXCN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUpcJZJJl1VE0IwNFSyBrE8zP9BC9EY5rWEA5BL+1i/cMRDgm4
 QUEw46ecUfPZ/ArdN3gsSbBAZA4wpRdZQopoIAlCF78AaVTk+0XLeBxpiuw5EmVeb+DjevkQpej
 JRqtEdYv0fh69/U0pcw4/EnFW8O8=
X-Google-Smtp-Source: AGHT+IFCoU6IobeHqtEzJvORkLSzrB3KFu52Lx/XsVGcmEgTNVIC2kovZhGLNvGWsf+AVNctQLhpxDakB5LbRhAc6k0=
X-Received: by 2002:a05:6808:182a:b0:3e6:140:c15b with SMTP id
 5614622812f47-3e638249507mr27387027b6e.12.1730752970657; Mon, 04 Nov 2024
 12:42:50 -0800 (PST)
MIME-Version: 1.0
From: Felipe Andres <mredisonedward@gmail.com>
Date: Mon, 4 Nov 2024 08:41:19 +1000
Message-ID: <CAH+AynKPwvB2YBAvkj+TQLLzp92mgrJstfWCVOwO8M+cEVoycA@mail.gmail.com>
Subject: Hallo
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000002971306261c548a"
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

--00000000000002971306261c548a
Content-Type: text/plain; charset="UTF-8"

Hallo, haben Sie meine E-Mailerhalten?

--00000000000002971306261c548a
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><span style="color:rgb(85,85,85);white-space:nowrap">Hallo, haben Sie meine E-Mailerhalten?</span><br></div>

--00000000000002971306261c548a--
