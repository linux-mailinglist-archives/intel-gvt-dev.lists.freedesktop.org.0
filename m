Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12488677262
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 22 Jan 2023 21:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A510E1B8;
	Sun, 22 Jan 2023 20:31:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9510E1BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 22 Jan 2023 20:31:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b4so12495261edf.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 22 Jan 2023 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pFakwnYIfXxyvIq/TmWIQmyIbOektZ5XkVKyl2za5kg=;
 b=A+9xx8fMN30k/ZR81Advy/7xqh3ku23MA0OtgGsQ7AlNJjgMcJ/ECxmlN8AgfXEC/n
 huAuVMg7DO6lOnOF+7v8V5GwIdXCH89AxQHLvST9XTzMssfNB+c6nWaYmIkPrMb+J/Mw
 bJ2Th/8bcPH2ZisRxKUGycuM0rbaFG2GW8TNSQQlHpysur0G363NL/MalUH0ks9Z2uuK
 A4aiSHLeJVlv6UE4orQSdHXxkAIlikijIuN6juGi3TQO0glYskPcOqkWIWX3M8GrtpXi
 dD3LU7slUFL098DbkuWC2xAtf73NOGT/U3u54v+mqyGhCOtR33gJRzhHAp7GYsx4kGRf
 09TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFakwnYIfXxyvIq/TmWIQmyIbOektZ5XkVKyl2za5kg=;
 b=Q0A12rALncwKjnmsBh+IwrRVATCQJmDJS658sGpL9QKERovbOeIMdb5oQ9ryVtdU1l
 GkoeKuhWm+7C+f+Giodv+AHp6p4xlnJg4Y9HJjW2HYX4sPfETU3NU5jOw1p2IVjcIfVs
 +gBJ3qfK1dZ+m2/81emri+6JCsIyfM2ZD2bBhIHNtDl35z81qiqE+cyDcvkqoDugYuiy
 uG0/H+ZRezdtO54j+1/KFZ94I+NNz8qXq2IdaQNrVLdyvKqwhinmJJt56VENT5/z0dBL
 P5ww+emFCocNU0fyG374LSx18Hn7kO2+h+U8+Q3wvnk5prjU87Q4Fl3PbMvoIpMCK2ej
 iIYg==
X-Gm-Message-State: AFqh2krvA+YWlMdstBc+RDQYmWtpCzp+J3TKl0c8nFqH5oipjPHjky4S
 EhuYOjVhYXz3amF3ws97eKqDQM1nvH0k7aF/+V8=
X-Google-Smtp-Source: AMrXdXuzZJMsYswQjoq+cSZN2dEJGCg78ip8xplSv64eliw97TGv/JnLiyPbl2A6AS3IhE3tS3S2RdwqdhGt9FVzn08=
X-Received: by 2002:aa7:c052:0:b0:48e:e88a:a4ce with SMTP id
 k18-20020aa7c052000000b0048ee88aa4cemr2653940edo.127.1674419490980; Sun, 22
 Jan 2023 12:31:30 -0800 (PST)
MIME-Version: 1.0
From: Victoria <victoriasollomon23@gmail.com>
Date: Sun, 22 Jan 2023 12:31:18 -0800
Message-ID: <CAHroMytHPO517DN+3UkX+m323G4Bw5o86t9Vpcr_xcTTOKGzEQ@mail.gmail.com>
Subject: hi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000f7067b05f2e02aec"
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

--000000000000f7067b05f2e02aec
Content-Type: text/plain; charset="UTF-8"



--000000000000f7067b05f2e02aec
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000f7067b05f2e02aec--
