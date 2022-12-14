Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D526064C907
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Dec 2022 13:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C52E10E3D3;
	Wed, 14 Dec 2022 12:27:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2124810E3D3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Dec 2022 12:27:44 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id y135so21166790yby.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Dec 2022 04:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jsCYEFS8rW6mpGPiyztOoeBj5I+u02MWRuVLQcK5cLU=;
 b=JWFPVn+Rfn3vT8RZZ0WAAiS8m4CAYhGDJMtRl79KW2MJDehH7suVdew8DYd+nU3TIZ
 ff1Bjdy7zSk/RRFmnNCA/F31GLNY+i/2mmwEk01z939PB9bw3gvXpZ3tJmd0oIwYNPZ2
 q/H+KwQ/kHg7CAFAZc11XgbF5SGniPWx0qQt/lx58wcdgvQl4jaPC20dnic75eS9zyHg
 q+PwTkt32Vem5e+3+MjMNsH+zCEBvu9Yt3O2MspebCtQ7XhedAa228WwpQlUErH5sAAK
 FMGOg4aZu5jx3SnFYhaFWxyq+4kXoxGLp3kAQ5sVfBM5N9rlPvhU6Jv3P0UBs7HsaBzX
 4jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jsCYEFS8rW6mpGPiyztOoeBj5I+u02MWRuVLQcK5cLU=;
 b=rrKV6GduAsbSdkfykti+h8X9Pd+3aOtVw1gF5ji6QFBkaqmS03hc7HrGR0IuHfT7JI
 iHIaqJQBPEFy8Of1lquulmLTcxGTtdcaxsKuys4+nmsb82mhGSAUkXOA4XK+nO11wIQl
 pad9FRtbk2BpShgTlt1HRybXAInJR227KgVqhd1K9ObDR7TOHdVDkBHYlpkuGWQKkS9p
 Eo7qnlQtKdZg8yvT8aYTj7coG8kMbMBSUSH/jrd4LJfXEMfipNdjCFVotcATe8lnOGet
 P62iVNdc8GC5urikYJv/hz8d1Iw1ICxPT5w2LCNvmvdeU5FFLwsgAjIeCII4dieFOSxp
 RfTQ==
X-Gm-Message-State: ANoB5plA7K/v4itmMyuZ15M17K/ganZeAKKJZ0fWJz6zUpjQaGF6FwBJ
 vty9rbnbD41BY9fuNEx8D+vhJbRyiq3unOhBNDM=
X-Google-Smtp-Source: AA0mqf4WsUKmKnRCV4+l9nt7s/ERKXzI8VvKEtctn8HTNOlnQl2mi2vHIus+6PnbUW+xVLrtoX1E1RIvCCU+2+Y0Ito=
X-Received: by 2002:a25:4042:0:b0:72b:ca75:2d69 with SMTP id
 n63-20020a254042000000b0072bca752d69mr1143718yba.5.1671020863291; Wed, 14 Dec
 2022 04:27:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:3da1:b0:316:1849:4cd4 with HTTP; Wed, 14 Dec 2022
 04:27:42 -0800 (PST)
From: Latifah Adamaou <adamaou882@gmail.com>
Date: Wed, 14 Dec 2022 04:27:42 -0800
Message-ID: <CAFDHBssWhio1cF3aSt+7hrTJN5VpG=b5CLcVG85bytN4+U46Ew@mail.gmail.com>
Subject: Very Urgent,
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
Reply-To: mdm223664@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
I tried e-mailing you more than twice but my email bounced back
failure, Note this, soonest you receive this email revert to me before
I deliver the message it's importunate, pressing, crucial. Await your
response.

Best regards
Mrs. Latifah Adamaou,
