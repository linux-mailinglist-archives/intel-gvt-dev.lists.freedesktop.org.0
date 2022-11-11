Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F4626016
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 18:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192710E040;
	Fri, 11 Nov 2022 17:07:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E384110E040
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 17:07:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so5224431pjk.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LICHPg6UnYkTNsPkbQmwYKBGSoVvJ3ggmuJEwwsBdfE=;
 b=XZlbgoFLBfg1b1W761+z1PDAgEb20H2QO0ci+u5UoReXW/AglYt37kfLNyiRzXCbun
 16a/vNSD6OLG51wXjymdIRV5K9+yHSAOu082YpoTDDKE/vWKWzBoXD0ip80QsNnXeMJr
 XUiBolJ/U5H4SS51K9h10zFLgGeuRJ3ETLcS/qaSX/VswfZGD0HWGQophC9d+8et+N8D
 Rcu5KGn6L35gbiXzVxNNzg/1YqsSpk7Imvy500y3L07kqkpPLt+0VZ5sct2ejFIWJ747
 3+UH3Cce+XE9LjmMHIqul5KXKnZHUHLmRehpGUfslQ2VrfCosOP4gZwFjBB/ttBcN/Ae
 9vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LICHPg6UnYkTNsPkbQmwYKBGSoVvJ3ggmuJEwwsBdfE=;
 b=OgA2xG+V23HHPxVTdXBODve5Qaib+nOO3kZV4WDOHKo1vaCxt0+oYsam+OT/43Z1ce
 d9Fp4H9oO15yNvaajIZnLXmBMV00uiWlpR8VbiIgKOLJTTHGZzIyUx3yUeb0XxPUPDna
 M1ShY0sQkbBFy1gdzABT8j5fq0RzaXL2OyjCC8GlJgjn6ZG7+d9afW3L3DS8yrhREVO3
 5BLJkiuXFPhMEDeub2SAISxUTw5O+79ifEytioS1n5Rs32AC0+cJtCUOMQAiu0/2B8jr
 LAyIaQGkKqT0KDGoHda4jQjtGfRBgOeubv5Vv0wuPBBz0MPB6KOkrlunTNi1p6mWd1rN
 wXzA==
X-Gm-Message-State: ANoB5pksM1zUVbWwP9RGgEzVJVRWbHGUsiT1508iBnavo4lilAzhn2Jz
 GbxyANy8hFryzL6CuuN7O+hpYg==
X-Google-Smtp-Source: AA0mqf5Uo+YykjZZDEd2A/F0GfL+xhYTbei/GO+GSdCfD2x/gs2dZlHf5v1zmNbQnCxh9OBRghbP8A==
X-Received: by 2002:a17:90b:4b50:b0:213:5c5f:f440 with SMTP id
 mi16-20020a17090b4b5000b002135c5ff440mr2919822pjb.15.1668186460347; 
 Fri, 11 Nov 2022 09:07:40 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 f18-20020a63e312000000b004582e25a595sm1591902pgh.41.2022.11.11.09.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 09:07:39 -0800 (PST)
Date: Fri, 11 Nov 2022 17:07:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/gvt: switch from track_flush_slot to
 track_remove_slot
Message-ID: <Y26BV9a9q8nBz/+7@google.com>
References: <20221111103247.22275-1-yan.y.zhao@intel.com>
 <20221111103436.22381-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111103436.22381-1-yan.y.zhao@intel.com>
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
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022, Yan Zhao wrote:
> KVMGT only cares about when a slot is indeed removed.
> So switch to use track_remove_slot which is called when a slot is removed.

This should capture the original motivation, i.e. that the existing
->track_flush_slot() hook is theoretically flawed.  I think it also makes sense
to call out that KVMGT undoubtedly does the wrong thing if a memslot is moved,
but that (a) KVMGT has never supported moving memslots and (b) there's no sane
use case for moving memslots that might be used by the guest for the GTT.

Bonus points if you can figure out a way to capture the restriction in the docs,
e.g. somewhere in gpu/i915.rst?

Lastly, provide a link to the original discussion which provides even more context.

Link: https://lore.kernel.org/all/20221108084416.11447-1-yan.y.zhao@intel.com

> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
