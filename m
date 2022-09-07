Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C95B06CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889310E786;
	Wed,  7 Sep 2022 14:32:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F3410E78B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Sep 2022 14:32:27 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b16so20033422edd.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 07 Sep 2022 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date; bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
 b=UtFlTSGHQz81OSpK49QGakNczTrN7BvVDcdecb2PlQLSH6U6g6YnfIOwEhF4HyopVw
 xF3rEa1JazWxVmoA4IZ4APHTWslJfRg5yYhTgDCuueeGynL8ZQ8rlmQ1XFto97Lt71ZJ
 j3Ra7mPDPEuM/14t68TI6JbC26x0Okvn0tFLgQTeFpImczwoq6TYczyXFG/k8mY/UwUL
 n4rphtthc3JujA/DBbZnDH2NqlI3e1mX42kS7zoBsDbrZwgnwP4UWzhHEqiLlccbumw3
 Wu+X+CCk1Fp6KNp6XYfEMT802FX63wwwnC1iqf8dYPeJE0BVyNRj/Y77DpMb+lFAEfsS
 NjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
 b=AUv7Mqx8h/10KUTtRBRdUn6Zlimf49FWGEP5yk8diR+0BoErUax1zDEqsEALMS+vq3
 TOHwMjFF3RM96jUmAcjn3SxMbOdn0LuipJirT5zqLMHE83BmfOlqVwq281oPWOx9kVtK
 J98JAIGpla5Bdhv1VdhqfEYXJnmjWBlHuEoibL0fyMS1ivbOYDQ9IJIBfHC7XpNoK3fO
 KTP8MgrziPhu5998Q3h5NAljsiJItrznwWFQvJswa2QBvRM1aeTXJy5XSif4loZh+WM8
 gGmIY/gNmf7nTfQdyZtArJapNI65xlg5+I0R928edm+HXyk0N1XwUSYIUd5CaYjiQ4BW
 ldXQ==
X-Gm-Message-State: ACgBeo2FB2ResgXwRoQukpAVontJnrgMkLv6ZlZ+dvrW8sEeFtslzTT3
 yp73wpNH8Qpc5ZK1vO9eev2JIkHZDSbnk+q0Bzs=
X-Google-Smtp-Source: AA6agR4u/dbCsJbsVZIBLL6h1UPerJ2TE45jgxUgoCjVrPyl8+wsl025ctgdSe/t/2vkl2wcEplmUnwM80u8Z9eZepA=
X-Received: by 2002:a05:6402:51d1:b0:44b:ea34:6c0a with SMTP id
 r17-20020a05640251d100b0044bea346c0amr3314952edd.369.1662561145430; Wed, 07
 Sep 2022 07:32:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3fc4:0:0:0:0:0 with HTTP;
 Wed, 7 Sep 2022 07:32:24 -0700 (PDT)
From: LUMAR CASEY <miriankushrat@gmail.com>
Date: Wed, 7 Sep 2022 16:32:24 +0200
Message-ID: <CAO4StN1OR4tXWWJAZ10p+-rJJ7qOsU8FxVS9cWv=PiegDVtnsA@mail.gmail.com>
Subject: ATTENTION/PROPOSAL
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
Reply-To: lumar.casey@outlook.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ATTENTION

BUSINESS PARTNER,

I AM LUMAR CASEY WORKING WITH AN INSURANCE FINANCIAL INSTITUTE, WITH
MY POSITION AND PRIVILEGES I WAS ABLE TO SOURCE OUT AN OVER DUE
PAYMENT OF 12.8 MILLION POUNDS THAT IS NOW SECURED WITH A SHIPPING
DIPLOMATIC OUTLET.

I AM SEEKING YOUR PARTNERSHIP TO RECEIVE THIS CONSIGNMENT AS AS MY
PARTNER TO INVEST THIS FUND INTO A PROSPEROUS INVESTMENT VENTURE IN
YOUR COUNTRY.

I AWAIT YOUR REPLY TO ENABLE US PROCEED WITH THIS BUSINESS PARTNERSHIP TOGETHER.

REGARDS,

LUMAR CASEY
