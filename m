Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06D4C3843
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Feb 2022 22:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC7410E159;
	Thu, 24 Feb 2022 21:59:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF29210E184
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Feb 2022 21:59:09 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id c6so2222201ybk.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Feb 2022 13:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=wv9+lUDiUamCN2D56q0OJAqCtadhguvOfwApXNhEE00=;
 b=hILtLVoo5W2+hBM4Xlan02qS50993LfJ89JU+7Y1yncXO9GKOFNAabULrgL9LGXnxB
 +f4oRJ599HGAKbCd9BizecVBnbQGTMHqac3+H6rAXDFBb4H6qH1IwuQGPiqltR4HJek1
 QdqtviXD3BEjBbtY9m89LRqH24+Pr4lVLHiJFMUFR/hQb/D74BnYgD0GqOyO/un4XaED
 XUV55IksQVeh8N/7eXmcEylEtd4isIXCtDCEgtamqh+j4/aU2YFB1sYcifL6XsU54N4t
 83BU6XENIT9vgWYzuCiQOQc6d6z7MeNL7P6QI6fXgdN3Inc0L6PA7zSCsAdoB3T21neh
 Cnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=wv9+lUDiUamCN2D56q0OJAqCtadhguvOfwApXNhEE00=;
 b=1CMrYrs71oBDQOduu+3eLxwylgxQ7gcxchMiX4uKZliaonjmIULLMJY9PtSmGB0Zl/
 ZyaCVh+IEhygvNqv2pTqE+kwkVOVM9U8N5EoJyI/98MBubhfyPOM75sdwG9PjDuCZgGn
 KaTIDm3zfAtozSIVknhvonABdvmpSW2BoupeUN2WkLPx//CvF14+1k1ewtZVkqCsqUQW
 7Kd4P+818luNrgxXUAsjyg1dqt4BGK7Ga1By1QWE7ow5U1NKWb9vhsj2fPRCcUT0L4bk
 OGCfFKfmxMeDDL4OS0o59ubVbOlkI5HMfMpj3kBsu7LNjjGkPPX7jIwPH3OXR8FK0bsE
 YK9A==
X-Gm-Message-State: AOAM532WtxOS7ytBbSOGol1vlkoPWMLhRArtxecZ75DkC4Zz/CGoQahT
 eVHWhGEdJQAKQWawy/vFQtC1oQk+SNVNUxZAVSw=
X-Google-Smtp-Source: ABdhPJzyZwtuFpiBUIq3/1/GJN7MnAtGUvpTv1COEMdfZzKwAcngUZ/Vni1EJRZNOGXJzkNV/fwKf7wfqmfyMhrB/WA=
X-Received: by 2002:a25:d2c1:0:b0:61d:add9:f029 with SMTP id
 j184-20020a25d2c1000000b0061dadd9f029mr4419481ybg.312.1645739948713; Thu, 24
 Feb 2022 13:59:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:7616:0:0:0:0 with HTTP; Thu, 24 Feb 2022 13:59:07
 -0800 (PST)
From: MR DAVID MORRIS <mrjohnwegener35@gmail.com>
Date: Thu, 24 Feb 2022 13:59:07 -0800
Message-ID: <CA+Kwxe9XS3C7vFQ0pWKEd++SyfUhiY3jBF4+RbGzxC-ZGfHuvw@mail.gmail.com>
Subject: Dear Beneficiary
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
Reply-To: mrdavidmorris1718@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
I am MR DAVID MORRIS, Inspection Unit Manager United Nations,
Inspection Agency in Hartsfield Jackson International Airport Atlanta,
Georgia.During our investigation, I discovered An abandoned shipment through a
Diplomat from United Kingdom which was transferred from JF Kennedy
Airport to our facility here in Atlanta,

The ATM debit card is worth $8million,And I  Ascertain you
that the consignment is in your name,you are advised to provide all
detail for claim.

Sincerely,

MR MORRIS

CONTACT.......... mrdavidmorris1718@gmail.com
