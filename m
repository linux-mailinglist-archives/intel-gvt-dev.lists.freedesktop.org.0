Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F237564F664
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 17 Dec 2022 01:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BDA10E653;
	Sat, 17 Dec 2022 00:38:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com
 [IPv6:2001:4860:4864:20::44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8810E653
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 17 Dec 2022 00:38:29 +0000 (UTC)
Received: by mail-oa1-x44.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so5237112fac.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Dec 2022 16:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMgfh4dNrbZNC0zackE+NFoHodFU+BrSQXwCeyK59sA=;
 b=QCv4Nxu9xObfnHf3+ER0xS/AaIKM9eeoPFDTf1FkohC+UTI4/Y9H0I9D8K26Ocr5f1
 Mf0ZBJtknbthPYMKVNyy1zrsnD/l5OR3ivnHqmu8r3Fu9gJ8NqUiOFXvCHyqSZvBlZKc
 dXbKeZFb+j1xGrQ+t1o6vjICTMpFRO6fm1EmtHEMqzSdtEDcyqVg/AU+u3bYO34xZi7V
 YpPr4Ba3B+O1MkW4G1Et4tolv9UxWD8wzsZQfcMveb8pq+PGIvMDs9f3NSOzGHd2OCLe
 /T0+98JAdXoQ47FrewDtDeRkcrhwLiY2SdcU+nuu2jU815KkBfFXN3yfiyc7DOeYzoDG
 IqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iMgfh4dNrbZNC0zackE+NFoHodFU+BrSQXwCeyK59sA=;
 b=hh9BiuXtwaVqcUOvhHljmIIsEvnzymoE6b7JeV28K/1GWsrNdhp90KBWFBiZb3HsnY
 gVAhYmCY2IdbTxaYy5gxazTZhM4Zr7hwk/bSBzexu7PQ+4Ex1QqDpnBXGTXfVuTAXyi7
 ITeB7zDvLsiU07iONZhVVaO+uVUnY+/a2yBz6cL+dE4B6YrJXrvoP6FR1xo/G9VSH0LT
 uq2dFJ0jg4DRxv8Sxrl3aH56dnu5HRYZhaeAICrzsYaaSNIoTs4dllubl07Pee0aFOFe
 J+ZREsHlRmZsZqwF5dZfpl7Up00qpbPhLxTR7/3vmsS0wxpsUojKdDJ0Dezyj236uxsu
 CFGQ==
X-Gm-Message-State: AFqh2koKUxnHXzfo8RfuDCEaVts1Pu/ofW5I5O5ACyQVjxnmI8VCi0Ny
 j2tk5asRfKtIFq7ByHlG2rtYDD31+VgIRXQKwmo=
X-Google-Smtp-Source: AMrXdXtHphJxHPlbWj02S2JO4eti7Z3plvmR5Sv3DEmf/iFWEcSryMrShx80VpEqfcVYm5jjHujRweAiOqChsyCP3Ns=
X-Received: by 2002:a05:6870:d0c1:b0:144:b65a:3b55 with SMTP id
 k1-20020a056870d0c100b00144b65a3b55mr1172983oaa.85.1671237508532; Fri, 16 Dec
 2022 16:38:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:50c1:b0:df:c624:f867 with HTTP; Fri, 16 Dec 2022
 16:38:28 -0800 (PST)
From: "Mr.K.Mashal" <vannankaar133@gmail.com>
Date: Sat, 17 Dec 2022 01:38:28 +0100
Message-ID: <CADo7EorGO3OCBvAyEGSnwJX7j1WmHk809f8mqVqG26yAn79X6w@mail.gmail.com>
Subject: Attention Pls:
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
Reply-To: nn9122250@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Sir

I have a Lucrative Investment business proposal/Next of Kin
opportunity if interested kindly contact me for more details:(
dalh52179@gmail.com )

Regards
Mr.Khader Mashal
( dalh52179@gmail.com )
