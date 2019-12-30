Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C060612CBDF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 30 Dec 2019 03:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620F889C80;
	Mon, 30 Dec 2019 02:22:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877E389CA4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 30 Dec 2019 02:22:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so12888290wmj.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 29 Dec 2019 18:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=cCgjmSxLWlMql57U+O40bnMOsF2pBGMu0xtRuJWN4EM=;
 b=Gb9EIurUSHFtkw1doX68vM3t9X5zftX3p8I5K6SU339qwAKSTMbSt2LLLTANBh4snq
 Io1/jUBSidqoawPc38vHO4owvBpBxHhTlYM9NMgGcwiMpBH5bFs6lUy5VFUd0g55nw1/
 AAjKBJSxI4GBOoTvY7Zl6RKXQJ06lqY0Fnuev0q1YZclMwXSUx16NCzf98Y1UpPAHWgM
 I0q9Sm1ngPEWDR9QHrGGy1Ds3x7R5mBJ6V34ONVRiWIkzOj16m2lTAeLZG9h10tIot6E
 tdtDe+tQlAao0AK9+bDCfnbxMxPtB4YNOHHGqiI14xc7O3kYnn6fKhLg4gaYSgvsKlWo
 DQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=cCgjmSxLWlMql57U+O40bnMOsF2pBGMu0xtRuJWN4EM=;
 b=saRiqYuSi65ooiJ2UeeXrLZRpipvJKOm1ms2rrm0j1JalwKEJmEnIaxVL8rowHnVYR
 /duzaKKA/gNyDi1UJMvwR1Ui2Z75trWxUUZbIlR85n8+O8gCx6AH9YjdgkKRxxgDNmy2
 qpD6H/hZe4yvWjJpS9YQVvKD/JNo0bBzQhJTgAKSxa2xRkl372ZQRC39XExe8ctYtwo4
 0cJdRmObf+iivfp+lX97fREyTGE53f5nuWC/Z64R7sFIia/vccUFJMxoNxDWtVa8t3gT
 NP3JZQ0EUafkHG4GldvnrPez2JVeC0/48pQbvIf1p9ZBh274cdnFOaeRKpCmtNgQZq3q
 c9OQ==
X-Gm-Message-State: APjAAAVgdM1GBW+xIcRgDuOxMo/nk7a8WSfR7c/OmDjQNDZ+Fqp/M5by
 riXjNIo1qyQYHKfs8GGTvhmZdWF5mCRWCa5ZT3Q=
X-Google-Smtp-Source: APXvYqzGif2wtcscyUTuRFqQmmbgoGwGyfB9xjBsxdkwotJHnuNHUA9Ek9+nCNfGQxLwcfVF01N1HOpVMly7OR6rF78=
X-Received: by 2002:a05:600c:21ce:: with SMTP id
 x14mr30201073wmj.120.1577672526115; 
 Sun, 29 Dec 2019 18:22:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:ec90:0:0:0:0:0 with HTTP; Sun, 29 Dec 2019 18:22:05
 -0800 (PST)
From: Mr Moon David <peter.john00775@gmail.com>
Date: Mon, 30 Dec 2019 02:22:05 +0000
Message-ID: <CAEaVSjjp+s=yCi3xweJp=RGY_S=Q8Yt3=G0_GnDcWUJSrNw87w@mail.gmail.com>
Subject: Greetings
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
Reply-To: moon.david001@yahoo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Sir/Madam,

I have investor that want to invest $6.8 Billion into a  company that
needs fund  for expansion only.He can not invest the money to new
Companies that want to start up but into Companies that has been
making good profits but needs funds for EXPANSION. He can only invest
in start up if the investment proposal is realistic. The investor is a
former Petroleum Minister.

His Area of concentrations are Real Estate, Biotech,Textiles ,
Information technology, Pharmaceuticals , Oil & Energy Industries,
Mining &Metals Industry, Management Consulting Industry ,Maritime
industry, Hospital & Health Care Industry, Consumer Services Industry,
International Trade and Development Industry ,Gambling & Casinos
Industry, Electrical/Electronic Manufacturing Industry, Insurance
Industry, Chemical industries, Marketing and Advertising Industry,
Leisure, Travel & Tourism Industry, Agriculture, Aviation, Retail,
Import and Export, Trade and development industry, Real Estate &
Construction Industry and any other viable investment opportunities.

If you recommend a Company to take loan or investment funds from from
my client the investor, me and you will be entitled to 5% of any
amount received by the Company from the investor but if you are taking
the fund directly as a company i will be entitled to 2.5% and you will
retain 2.5% as Global Finder's fee commission. There will be a face to
face meeting between the investor and the investee after signing (MOU)
the (AORI) should not be less than 3% per annul if it's loan or direct
project financing.

Look for a reliable Company that need funding and we can easily make
5% of the amount received from the investor but we need to maintain
absolute confidentiality in the transaction as the fund provider want
to remain silent, so you have to keep it highly confidential between
us.

I will need the company profile and the project summary of the company
that will need funding to present to my investor.

I look forward to hearing from you.
Mr. Moon David.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
