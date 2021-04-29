Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681D36E269
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Apr 2021 02:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195E6ECAC;
	Thu, 29 Apr 2021 00:14:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62726ECA6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Apr 2021 00:14:47 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id md17so6278285pjb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Apr 2021 17:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=TvDH0Ufqq951p1SmGaor3zZZi0JBju1aRHwGT5Ex+6c=;
 b=EaMaCh6a0ZBZo8wAJIP7BjIw1/HHLcmewRXhSa1wQ4F4G5+NntgKtKTvs0aLcBabg+
 oK9E6FyikHYEzaKIF3H+v2BgUFUk41B2R3lNXHswJXJpIe5GyJC6EAo6G4d6a1iNzCbv
 O+4erK1G/wGRrlW4D8blXKYOi73dMezNBPwNm5f+uib+CqqSY9EbOEa+xfGLQK3fdUV1
 TAlohc/Q6A6EsNf3DXE7tS3jaT02qfKAkUrUpZMoAzNHNLgbnSK6P6OkEfm+zOyQ7ixy
 VNjWxuvazwlnBf5SUiI+kyrg6sMD6HhNcFL3IVQT7EyTquGg94w5FMVtO5kGC4OrCWC2
 P26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=TvDH0Ufqq951p1SmGaor3zZZi0JBju1aRHwGT5Ex+6c=;
 b=amBnKrSov/eYPhGyRS8gqwETqYGJC4P4Q9bOXEvqqRtbuFqcqYE4t1tWlV8XJe/i2a
 VLGM+o+XnoxmcQunWWIO+/OXIEj6F8m0wdouJi/2+ur9/bwU8I7l7D2EWakXbJAmKPep
 w246VInW+gkMuexa2UPQA14cQs5wEGeSuvM0ceHusQUJtn0YgLauhLEeRP2URLXlZNjj
 OA5pfQrQfz0fdbpWFRxTsaPB+oJ5dayjN+zX+MV+tjeSSQkpB75h/v+o2XY7bQ6HwI8w
 yjjuUMwG+BQWdRgyKeytzQ72TS5zC82/9hYhnYKyHPHYLkHHQM4QVCDG1tafgycHIlQN
 hleA==
X-Gm-Message-State: AOAM531C3N/j3gyf60JJ7DoOh8li0fn7CXjbZBLftf54RAaL2YtgsFdW
 L/K1GobFF0/EaNu5IkxkQIy93sqR/x5dBHrmm0w=
X-Google-Smtp-Source: ABdhPJz/6JRSNlwMdVaj59SNw3G7dY+M9v7bSwXRdPLqE5HgPpKzq5lbVC56VzRTyhCQDP3K6IR+HXTqD1vCPkvvCHI=
X-Received: by 2002:a17:90b:4a4e:: with SMTP id
 lb14mr6366690pjb.115.1619655287642; 
 Wed, 28 Apr 2021 17:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:6426:b029:19:764e:b00a with HTTP; Wed, 28 Apr 2021
 17:14:47 -0700 (PDT)
From: Mr Kingsley Obiora <maryclove123@gmail.com>
Date: Thu, 29 Apr 2021 01:14:47 +0100
Message-ID: <CAFBdPmeS7juwWtx8GpE-t4vAQssBJLcbDH2eYSHSEDuv1OT09A@mail.gmail.com>
Subject: Hello From Dr Kingsley Obiora
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
Reply-To: bwalysam@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Sir,

After our meeting held today based on your funds, the management want
to bring to your notice that we are making a special arrangement to
bring your said fund by cash through diplomatic Immunity to your
country home. Further details of this arrangement will be given to you
once you acknowledged this idea.

Waiting for your soonest response.
Kingsley Obiora
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
