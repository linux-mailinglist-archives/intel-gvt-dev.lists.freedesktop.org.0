Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913A48252B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 Dec 2021 17:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B489E06;
	Fri, 31 Dec 2021 16:32:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12A89E06
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 Dec 2021 16:32:57 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 139so49718854ybd.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 Dec 2021 08:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=T8uGhMRuHlis+b0pS4wFfSJuKWIM8QnixVYgyB5TaOs=;
 b=faoDf5csKGSr+rACgQ0WEGabc64/b7lWs8pieROzd8kiSDi2Rp46BPcWu4QkMMO18w
 cw7yMVVdumyQ8e1YI6cO7leOt4I8H6x8JIPM9i65YY9tuRZ/ydKXR+iFlP5MJDkGoDgO
 FZWWfzTyHy7TulozL5YlAMBON65ALvFUaqqxZCqsjQNxydQkGGgApkGg9E800qbzPBjV
 CY/FumbIRj1obJQXEqVIMN8ZIhh6CQZjIiZgIuv6nTjDOBy2LoX4SmAFDCFi9ooMEBNz
 xx1H6kYj7zh/kYKqhr2zMNENRNWS45Cl7ARkw4K+fB9mQck3jxd4t214rLNXAgHpO5oi
 D85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T8uGhMRuHlis+b0pS4wFfSJuKWIM8QnixVYgyB5TaOs=;
 b=qLNaV7Ay8j+tybIHoyJDd09V81RXzOPkw3yKN0WIiq+/c+ZXFy5Nc6lW0HfBzdkSm6
 vTJ5w2go/VQulh396pa8OALsrH2bIe4vV/uM7UmGwOzr6X3woJOwHVFGsrgfyiNxP6YK
 s6f4FEAo/L1c3lA03kMKaF6TAp5hYQoYrIVN39BVDJlmtJZy28OyK+8yDOGI3QUCvJe3
 Xlx0R4T2aHdP1Eu9vklGwlBUz3NsTuLco+xBl/t1RDoud9TsHljkU39rmUWfg4q1Lw40
 Up9tPyYR+fLp3c0frqd7VrihjLNPmHzsVJSwVz5TTNuRBJ20iQrlyPBnqCvqwaDcmLDl
 Tptw==
X-Gm-Message-State: AOAM5305sdGPTvL3BsIigfPM5xFnG/yL8FZxSWgl8kDpZ1jm+xFdnJdm
 NGiaSNTSrOXBAEG1ajZcL2+uWHuIVY1+HPObQ80=
X-Google-Smtp-Source: ABdhPJzHk/kZhdutfU9vyTeB+CU2+/7b0uv2MNwWrENIxjTmhX1JDNthsZ0VyeH9TZL2VEBEfWFKitP2M6eg2G9zCZs=
X-Received: by 2002:a25:2c05:: with SMTP id s5mr30793735ybs.402.1640968376806; 
 Fri, 31 Dec 2021 08:32:56 -0800 (PST)
MIME-Version: 1.0
From: Karen Owen <alphamballo50@gmail.com>
Date: Fri, 31 Dec 2021 16:32:46 +0000
Message-ID: <CAPk9JkO_hAg4X9yHdjQLzReri0oW33u10S_bU2pE+vFPtsAf3A@mail.gmail.com>
Subject: hi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002feffa05d473b9be"
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

--0000000000002feffa05d473b9be
Content-Type: text/plain; charset="UTF-8"



--0000000000002feffa05d473b9be
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000002feffa05d473b9be--
