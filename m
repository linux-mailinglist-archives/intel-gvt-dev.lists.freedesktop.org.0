Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F745369528
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Apr 2021 16:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1F6EB9C;
	Fri, 23 Apr 2021 14:55:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7856EB9C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Apr 2021 14:55:09 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id nk8so10077265pjb.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Apr 2021 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jxmDMGWdwPMC2ITz1x56mOjV+1V5fzXaXwc9+QMA38Y=;
 b=YQz4inrrA8dR39OBSv8X1ii5R1PGsQQmqg7tSOvAf9+DT12VmggRvu5Vwi9UqILlZz
 jSTZpO7FfW1DP9Zt+Oc+aAzDu7nI+SYGF9XYSCzu8TBqzI4QAWJyUOSFqGZrdOmkBSyj
 BtYiPVnbn+VOEV3sKG3+iYoClPkAXvsGN+A7n21BLV/YqoV1MGlmE3OJtnZRUaBPEtjU
 jLMGKkMkZzz7Y0+gn5qJ8oY4GtCD7wa+OLunKVrpNjyyGsz7Po2cR7Z7rhqIvj1epMER
 Q+k12NPIr5bqk0LJbPLL9+u5fzL3k765NjLJNP7k1trBF1Jnyqr8pjspPP4gWNuxKgX5
 p50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jxmDMGWdwPMC2ITz1x56mOjV+1V5fzXaXwc9+QMA38Y=;
 b=d6FXAg7XlXSjltNTOZLBVar82Lpavb4qQCC3hwmNzSzviw7jr6Lq3/swxT01n2bRnN
 PfJfA6cHns2XHvJZ7dDMEb1yPj11PZ5EQ6VZ7102NiR8cGXJWlkMQDsvEDT8eBtQsNV1
 WrDZbK3iU1LII+O5RnZ18rJrTUyFVjelX9uA9EbR/cTdMzwkImSDZ76s3sYasuM3LcTT
 hCwBjIKGkYu2I450MZCreBtWZsfwnfzuMWpFp8HrpMuk7MB/OI9PFptIM55dpAXGP3r2
 lzA9Z8WshmzFrD2uxafx4PtcvM+PuVh1O3R8errTR6uWo8CayvgacVuTgW2rYj5OFkUG
 MWAg==
X-Gm-Message-State: AOAM531EtOnqDbwQ+l4xGJ0aYHI/3vB892X404HWoxCAFTRe+f9nZ9Qd
 ZWfvz9PzhoAKNg0aG8pZHfjHdqRO5wnHl+kk/5Q=
X-Google-Smtp-Source: ABdhPJwrTyL69aWYfR5JwKcbtrOres882aBS/YWoClJbwvSHDIwfMlNgmDbt53wHtewPjBHrVVujxcvBDXzpQZGtNYg=
X-Received: by 2002:a17:903:31cc:b029:e4:bd48:c8e3 with SMTP id
 v12-20020a17090331ccb02900e4bd48c8e3mr4378476ple.40.1619189709322; Fri, 23
 Apr 2021 07:55:09 -0700 (PDT)
MIME-Version: 1.0
From: Karen J Brown <karen.j.brown211@gmail.com>
Date: Fri, 23 Apr 2021 14:54:57 +0000
Message-ID: <CA+QsSg=Qr0Lv7=PKobBfoYeDOvCBAUP5RqHwSPOpgcbBOJq9uA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0809886948=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0809886948==
Content-Type: multipart/alternative; boundary="00000000000072bd8605c0a4fb1a"

--00000000000072bd8605c0a4fb1a
Content-Type: text/plain; charset="UTF-8"

 Can we talk please ???

--00000000000072bd8605c0a4fb1a
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">































Can we talk please ???































































</div>

--00000000000072bd8605c0a4fb1a--

--===============0809886948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0809886948==--
