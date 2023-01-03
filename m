Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274465C8D0
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Jan 2023 22:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5863510E233;
	Tue,  3 Jan 2023 21:19:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253410E234
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Jan 2023 21:19:06 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id c2so6424146plc.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 03 Jan 2023 13:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c3u4viFf4xTjR77nQ+iN3D/WVZD7odj3dDROxrzHS78=;
 b=dyf43qxv95faYYtccBnBODi9tn+YtYQiEUinhWbNp5MX3EWJhsZ9X15/P/Dt9QWb4N
 hUUpTXEEJfwsqQgKnE/MYcAamYefLp1pkwUpGqnD8Knz7ls/aY+4AmM9gKvLvlmvzkTx
 q3BgHiXoCsUd6x05LXCsLYNBTgu2LPrA7gkiTvupqrKxy+8LVCX9gNp5V3mrj++k/Uoc
 jDIpurpOJtSk3WfA0Xesle/v/SllByEl6pLvTkB1oVFhqtKigbPwsxHY8KSValZf+1w7
 eEBGKcYBblNYQ1vTB1NZMx6eXx1r5g3qh/GKQddP+TS7F5WsR4XAoF1MGPRxeb8hXeA6
 2eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3u4viFf4xTjR77nQ+iN3D/WVZD7odj3dDROxrzHS78=;
 b=Hl6uOXh7jaYmqCb2o0+v0EAGTmnj7PitlsAQvQBqR/t1AEKj7f0l/yylEUpUV4DtbL
 Wpbyz/OLSxVjaUpCvM5UMA1yadWj2l/N393JgeCXQ4mPN4AXfjOK4GrLuOHrrdF1a1Ap
 yhMY93qn43GiWy/okhwvNTkzjFspQopAiW2kPOCPaUuEYV1l/rMhCY8CYbhsB7nN58cY
 I0hQDF4LUBGfikv33RHkvyRVgdq8aOhJRmvWCPjjWUXUDsVsyhH8lJEQOcp2RdIHRh/t
 Gm0msFCYiFZc4zoAIGtaOARsnBXrFi5qjovWNyTcN3AmOXuQzvfy1ES74DNOWsOhsP/s
 Gp6Q==
X-Gm-Message-State: AFqh2krr+wO3sauk7OWx+/V25Tl3NjFKx3lZNGufHF+VErCj1TbOGmSZ
 NZsBsFxFYCSP6HmAMBkG2fFJiA==
X-Google-Smtp-Source: AMrXdXsRrvuXTzfkRt6Y5pbAIJNM2f3D+xwjUMpE2J4UbGs3IWYjjgM7o/7PQF5PzULnMVN+gIs1QQ==
X-Received: by 2002:a05:6a20:2a9f:b0:a4:efde:2ed8 with SMTP id
 v31-20020a056a202a9f00b000a4efde2ed8mr4997943pzh.0.1672780745919; 
 Tue, 03 Jan 2023 13:19:05 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k12-20020a6568cc000000b004788780dd8esm19141338pgt.63.2023.01.03.13.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 13:19:05 -0800 (PST)
Date: Tue, 3 Jan 2023 21:19:01 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 26/27] KVM: x86/mmu: Add page-track API to query if a gfn
 is valid
Message-ID: <Y7SbxcdYa7LKR43f@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-27-seanjc@google.com>
 <Y6v287BFez8tU43e@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6v287BFez8tU43e@yzhao56-desk.sh.intel.com>
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
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022, Yan Zhao wrote:
> On Fri, Dec 23, 2022 at 12:57:38AM +0000, Sean Christopherson wrote:
> > +bool kvm_page_track_is_valid_gfn(struct kvm *kvm, gfn_t gfn)
> > +{
> > +	bool ret;
> > +	int idx;
> > +
> > +	idx = srcu_read_lock(&kvm->srcu);
> > +	ret = kvm_is_visible_gfn(kvm, gfn);
> > +	srcu_read_unlock(&kvm->srcu, idx);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_page_track_is_valid_gfn);
> This implementation is only to check whether a GFN is within a visible
> kvm memslot. So, why this helper function is named kvm_page_track_xxx()?
> Don't think it's anything related to page track, and not all of its callers
> in KVMGT are for page tracking.

KVMGT is the only user of kvm_page_track_is_valid_gfn().  kvm_is_visible_gfn()
has other users, just not in x86.  And long term, my goal is to allow building
KVM x86 without any exports.  Killing off KVM's "internal" (for vendor modules)
exports for select Kconfigs is easy enough, add adding a dedicated page-track API
solves the KVMGT angle.
