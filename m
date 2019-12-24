Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031AE129F13
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Dec 2019 09:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98876E04E;
	Tue, 24 Dec 2019 08:37:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2F6E0A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Dec 2019 08:37:19 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id t17so16034660ilm.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Dec 2019 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=LcGU1mt+nAQIi3eKcWZpiy7DqrkNG23tK1MNYV9CB+M=;
 b=VlyE5hkjIlVtebFVtbJSUDG1nq6yxqsP+CXAAvK16kEDCa9/FIjqePwKOUOUFxUPGI
 IobnBKqUZtvWs9liflZ3kccv66QhBRcGlV0NLmY+Uo4N83fE4acq5fKevjm3GVqyORPq
 V25kDNfLb/u3NDc8qTILa6U172uqigqrULaJBwbLq67hwZ4izN64H1YClKD775qzZNF9
 0l4JMYDmF4urkgDiYDNvOqEpGdvq+E73I4yTDC9aWLwqkTeAHCJ4Ixn//xPq6JLVBBNn
 aamV2t3zoMGAP8AF+RdWv4cRolj9/iVR4FvRYYpwL/EkEZCm6WUSjJi89kMXjGu5nUwC
 ihKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=LcGU1mt+nAQIi3eKcWZpiy7DqrkNG23tK1MNYV9CB+M=;
 b=FL96LwSvCwyYovTizkEFS2w4HI5ZDNNTS5DIfr6fOp0vVhe3w0/b/XTXbcYvrEwx4S
 w1RY2vFS+Oqr/BPdR2sOPjhY1lLyXPWcWaizwd3HQBIT/jyyZ3fGRWOqoerC/Oz1QNR6
 HHj8iP9d+pcRV5wcvOnCumFSdbXgLb7zFl1J9Qz8+zgGVQtwBF/57YPep7lzvDL9Q5h8
 SfV3ZGqGw+ItPnoiQL0nNJOBljj6qIi6TOkJtR+rZJp8Nmo0GbuLOCEJnfAUf9EngrH7
 0RFQdopNrz8ysy4WqkHShqI1r16zsiaNW6HjmlD83FUu44J4FB51xC762gIWsqOATrcq
 YX8Q==
X-Gm-Message-State: APjAAAWEty9j7PbtMvC4Nbe/6IinTfCq+cd3C0ELPL/+WbDx9gUBSdvJ
 1b6PttuJuf6c/hPwZXJM84M/7JFMpt6cEflcRNs=
X-Google-Smtp-Source: APXvYqxLrvnOpR+O6ofXnSEOnwrvGziUPmMlJTtG0DR2NirldWli2cXJyiYqfAfUdIRDZDD83uetmfvXHC6vAEF7nxQ=
X-Received: by 2002:a92:c50e:: with SMTP id r14mr29396039ilg.52.1577176639205; 
 Tue, 24 Dec 2019 00:37:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5e:c244:0:0:0:0:0 with HTTP; Tue, 24 Dec 2019 00:37:18
 -0800 (PST)
From: Beth Nat <am19040@gmail.com>
Date: Tue, 24 Dec 2019 08:37:18 +0000
Message-ID: <CAEgaL+akE_7uuR+QBv+=W5npZ3Bg=jguaB4zU63CGVjztQeQyg@mail.gmail.com>
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
Reply-To: bethnatividad9@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

How are you today my dear? i saw your profile and it interests me, i
am a Military nurse from USA. Can we be friend? I want to know more
about you.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
