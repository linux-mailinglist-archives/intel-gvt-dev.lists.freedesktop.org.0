Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30C552E8A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jun 2022 11:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF1810EF0A;
	Tue, 21 Jun 2022 09:37:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818E510EF0A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Jun 2022 09:37:37 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id e4so10830193ybq.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Jun 2022 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
 b=cYTFPAUCRTmBkCR+cVA5ZNzjA2Uqgc/HjR0zlOgbg9VuBnX3dwzG4Kj4FjhnRnvcvi
 wTyu7niNLf4R1OK+/LKzjCUdZ6XYPAkUSTnlVnVi+LNWF7h/kdKvp9e/2HfkHETOu+VA
 2PSxObV5wY/xFH3voyR2x2qFYgLNClifj7+m1vJSVh24kwl8FGKk16kvXtvOc5VNOcrH
 UyKoKG1yWb9wGAVlxzIf2tj/E95L7Uf8qdMRFG5eH2sJkEk6Ptgi4txcgY8ONngKnpoS
 ooFz1cPReMEGpVh7DyEHUxeOUISoI1NpJTxEGX0hj235wu00/Nw5bO0+JQPRTCdmby+0
 /3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
 b=BXTT/uotn+mq7l961Q89OAmFZ2G/tMZI2CHSGh+1kv936N3FXoiajmm3Le+6ycBF9M
 U9qKqOW4Xu2IJwmypytyVVkEoZSgJLtWZXqgBx2fUUGbWdD7epF/LsYO5lHK0RER7UZf
 5+uTAKFO3VEk6h/3nx5QzDVREjDH1MJtceMCgp1PcRea8opbJk5SFA6edksKgeQSABXu
 kTDuQXt0BgLG9sCjhMVPW/1pYpqE+0qDFJEGeCDXmPmi1to1XMuIP1EiTSPvpg6lDx1P
 MDOMttXYTqfysMEzFxGjOr73jOuDPMUwsjc3+ne2p1fwMEG2d7khENL2ykA5oSreZsCw
 f1Kg==
X-Gm-Message-State: AJIora8drWDh2AaeY8LLuL5yS5Qqvf2kk/geqDzrgaBX5EhgkOtJZVT+
 Zsi0J8XUQnryGjsGqB7cPrF09TBbMIOsVs7Rw8I=
X-Google-Smtp-Source: AGRyM1s/+WOFM12bU7OZIdCkvOR7pxg4SYt+lPISunN/vKsxgA44GhPMdCRChVbTCxEcM9644YCRjMJp9MGT8NprzSY=
X-Received: by 2002:a25:a066:0:b0:664:411a:1071 with SMTP id
 x93-20020a25a066000000b00664411a1071mr30958144ybh.366.1655804256510; Tue, 21
 Jun 2022 02:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e10a:b0:2d9:e631:94d0 with HTTP; Tue, 21 Jun 2022
 02:37:36 -0700 (PDT)
From: Dimitry Edik <lsbthdwrds@gmail.com>
Date: Tue, 21 Jun 2022 02:37:36 -0700
Message-ID: <CAGrL05YAoCppH57zvOR2tcLWnZjxqWCDCU1_Az8pwHME1GWH0w@mail.gmail.com>
Subject: Dear Partner,
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
Reply-To: dimitryedik@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
