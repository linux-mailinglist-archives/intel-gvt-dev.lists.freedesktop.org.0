Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC93642CF0
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Dec 2022 17:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6B5892F2;
	Mon,  5 Dec 2022 16:34:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6640D10E263
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  5 Dec 2022 16:34:32 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x22so6796312ejs.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 05 Dec 2022 08:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
 b=M4hL4Dkh0GS+ejIid/YSsq8jpzXdTpGAgUJKycJ35EFDygxWeaszkk7Z6rnTlj8Hn+
 NuQvQcVQMOFEzRX19K5Y1qo9cY3xjKlONbvZNOcKp/98mrRm1CKGttwKzdqvvqPMOe4A
 3mlI3wUilgBVy+Wqly7/hLRvzYcWi4MStMmcJnc62nvI81vAge4l628SQCDQWwMJ/LLZ
 DtfBlL8NRNKRbfKvxz7qa+Qu1CFcWsvJrR6ppkf9ONYkGljYFc9SqXm3F4bNc22qctAr
 5d6UxG1WJ04P0X0t/6skAgZ1hjriOEdGIMRXyQGrfp+8Nfdhf3OouuOm9tmj93CJYtCE
 Yzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
 b=W4N62kt28SgLljGXZszazeBm8BUpmFPzdgVZ6QTHwDJgzzfXClA8fM42MNQdPsTKwK
 IF5BBifxBjR8izXAiqjfvS5li4UvjtSzhGEYgUeoy+PGGCrzgjiQf+spAoa9nm67kQQf
 dVaeKhTO94RQFOi46mt4eS9swieLmn7+5F+lq3kFbiK/SrVlBfnqBdOJQQHjTK4QaPdf
 wok0j6FMS2wjNKD+QGPCps8HLP8xqpWNwJd6pxLW2r8BHEx4lIDXOrF1u+PBxY5RUnih
 bqXGdaAtJAQnpwmqomCaCCzHiNG0q0IkNYmFpHliujw82f29fiZ6dZ59ZnS9AgHAklbm
 kvuQ==
X-Gm-Message-State: ANoB5pnV+kGIiAUA/TzlSjhRYVNKTaGz1NS3T65R0KbTQwkOh5KsZE24
 LPH4deUVsffC2rGhP+XBoyVojNxZu696ZlRrRbg=
X-Google-Smtp-Source: AA0mqf4Fgg09FLsqqE3BrNtfLt56BRMkjH137pnBFQmTk19/gBlz8mHCBmdhXz0809KBf4m8ZHJEYSuDE16GSJgzhaI=
X-Received: by 2002:a17:906:2404:b0:7ad:d411:30af with SMTP id
 z4-20020a170906240400b007add41130afmr27376154eja.636.1670258070902; Mon, 05
 Dec 2022 08:34:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:3b6:b0:27:90e6:e1d1 with HTTP; Mon, 5 Dec 2022
 08:34:30 -0800 (PST)
From: Philip Manul <alomassou1972@gmail.com>
Date: Mon, 5 Dec 2022 08:34:30 -0800
Message-ID: <CA+_U6tjoYsXiWpQTRE+oV+pARumxEg919oTO_B7BXFDqCyL2TA@mail.gmail.com>
Subject: REP:
To: in <in@proposal.net>
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
Reply-To: plml47@hotmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
