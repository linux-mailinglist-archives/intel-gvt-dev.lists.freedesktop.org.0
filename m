Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602A3329FD
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Mar 2021 16:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C2C6E907;
	Tue,  9 Mar 2021 15:16:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1EF6E907
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  9 Mar 2021 15:16:31 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id v123so6956001vsv.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 09 Mar 2021 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=7Vrbe4gpVhb7cfcmpNanXi5E+OCzidx3VGMrGNR2bC4=;
 b=iG+PEPmaHlHo7BIDTdfef5r88OuWpQOqhEH2qmezQYHakeueSZdtECnOxaNFPKT9CB
 aLLijSjwuQVorDAEHnskHKoazheLbTgoFOH2IO0bywpBdkqxbvNhSp+AuzzkPltfZjkD
 FjTTrNk9SO33wfLNvS9nByjMp72fepAXXy19dOfqtAsx4HxmPonpcVTJXrYVQmJxHxXa
 AzJWFsWLVvJfVScuD99VDxmPz5IFH+JeT+BdI/5UjB5u3ljOPGeno4uGqlf/Z8N2nRtY
 ROlA+uMiGucX8LIxOcsYJNKNu/TkjgiHO1C+jXYPHopFB15mBvJWDTUfIUXFYNAfd4q+
 86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=7Vrbe4gpVhb7cfcmpNanXi5E+OCzidx3VGMrGNR2bC4=;
 b=phICJStiM3FQ3929kH98xctd6HqfrasKW59Zg6mSvJ9rATpDE3IZLe3zSLY+If4OR1
 cfCzahzkTuHGqrSAhJywYT+AVqj2aHgBXxdycBq6z0BXjo/Aa/NDWyk45wddbEuhm4VC
 k9keN/R8+ikcCqlEKuQL4eWaVrc/xZb0/wrjjqBJ/0Rd3xaTjVyyAyzOBshQYzBdJ1bN
 zhTVTRdEsmXBGKerxkCnLalhqQDPLTXSS5RbqLQaDR0HcJA6Z3ZhGGuaO5QwpEKUOQos
 sLRQ7B00VOk2APiEAGgDKODewHtJEJgZ06eQZjQVEYIfbOPdXjC4AL8+MWw2MNI3KHhB
 E0TA==
X-Gm-Message-State: AOAM530Irdbr8LSi8ckNs5iPHa1VTARIwTXUQZNWtCktNbiGc4QGl0jh
 AswLby76igFaHLadb9wPzIy5ELJe50bLlArtKR8=
X-Google-Smtp-Source: ABdhPJy9BBpeWXWCzuTiulojyYdgac59jMaZMyVdwFl3oYPmplUKQv1r1LrJzyZzXExNPs2KOA/1mgAnINQBECvVh48=
X-Received: by 2002:a67:2686:: with SMTP id m128mr15206115vsm.31.1615302990249; 
 Tue, 09 Mar 2021 07:16:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:2e8f:0:0:0:0:0 with HTTP;
 Tue, 9 Mar 2021 07:16:29 -0800 (PST)
From: "Mrs.E.Glenn" <mrganuserge654@gmail.com>
Date: Tue, 9 Mar 2021 07:16:29 -0800
Message-ID: <CAH16wSN04Q1+cGtUxisTrHBY3uKhmkpr-ckyqweDCj+psxNsgA@mail.gmail.com>
Subject: From Mrs.E.Glenn
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
Reply-To: ezbtg22@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Dear Beloved,

I am Mrs Elizabet Glenn from Israel. I am a missionary but right now
in a hospital bed in Israel. I am 59 years and childless; my husband
is dead. I was diagnosed with terminal cancer. And my doctor just
predicted that I have but very limited time to live due to damages in
my system and as a result of that I decided to dispose my 10.5 million
US dollars to a God-fearing one for the continuation of charitable
work. This is why I located you.

My guess about you may not be accurate because I came across your
contact at the humanitarian calendar event of the year but I believe
in God who divinely directed me to you for this solemn proposal of
charitable work.

Therefore I wholeheartedly wish to bequeath my fortune to you as a
God-fearing person for the continuation of charitable work anywhere
around the world.

I shall be going in for a surgery operations soonest and desire this
money to be transferred to you as I do not wish to leave this money in
the bank because bankers might misuse it for their own interest after
my death.

As soon as I receive your quick reply assuring me that you will
utilize the money as I instructed you for the benefit of the less
privilege, I shall give you more details and also instruct my bank to
release the money to you for the charity project. I hope you receive
this mail in good health.

Please contact me on this E-mail (ezbtg22@gmail.com) because I don t
know what will be my situation in next minute,

I am waiting for your reply.

Yours sincerely,
Mrs Elizabet Glenn.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
